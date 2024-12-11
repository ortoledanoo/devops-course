################################################################################
#                                                                              #
#                      Kubernetes ContolPlane Setup Script                     #
#                                                                              #
#  Created by: Or Toledano                                                     #
#                                                                              #
#  Main Usage:                                                                 #
#  - Initializes a Kubernetes Control Plane Node                               #
#  - Configures containerd as Container Runtime                                #
#  - Sets up Flannel CNI Cith Custom Pod CIDR                                  #
#  - Extract The join Command for Worker Nodes to kubeadm-join-command.txt     #
#                                                                              #
#  Prerequisites:                                                              #
#  - Ubuntu OS 22.04                                                           #
#  - Root or sudo privileges                                                   #
#  - 2vCPU and 2GB RAM                                                         #
#                                                                              #
#  Note: Run this Script on The Master Node                                    #
#                                                                              #
################################################################################


FILE="kube-flannel.yml"
POD_NETWORK="10.200.0.0/16"
NEW_ARG="--iface=ens5"


# Disable Swap
sudo swapoff -a

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

# Apply sysctl Settings Without Reboot
sudo sysctl --system

# Verify
sysctl net.ipv4.ip_forward

##### Install containerd

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install containerd.io


#### Configure containerd To Work With K8S!
containerd config default | \
sed 's/SystemdCgroup = false/SystemdCgroup = true/' | \
sed 's/sandbox_image = "registry.k8s.io\/pause:3.6"/sandbox_image = "registry.k8s.io\/pause:3.9"/' | \
sudo tee /etc/containerd/config.toml

sudo systemctl restart containerd


# Install kubeadm, kubelet, kubectl
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet


# Run kubeadm init and Save The Output to a File
sudo kubeadm init --pod-network-cidr=${POD_NETWORK} | tee kubeadm-init-output.txt

# Extract the Join Command from the Output in tee Before and Save To "kubeadm-join-command.txt"
JOIN_COMMAND=$(awk '/kubeadm join/,/discovery-token-ca-cert-hash/' kubeadm-init-output.txt | \
    sed -e 's/^[[:space:]]*//' | \
    tr '\n' ' ' | \
    sed 's/\\//g')

if [ -n "$JOIN_COMMAND" ]; then
    echo "$JOIN_COMMAND" > kubeadm-join-command.txt
    echo "The Command Saved To kubeadm-join-command.txt"
else
    echo "Error! Command Not Found"
    exit 1
fi

# Execute Commands From init Process
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo modprobe br_netfilter
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -p

# Make Sure br_netfilter Will Up at Boot
echo "br_netfilter" | sudo tee -a /etc/modules

# Download Flannet Init File
wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml




# Update the network CIDR 

sed -i "s|\"Network\": \"[^\"]*\"|\"Network\": \"$POD_NETWORK\"|" "$FILE"

# Add the ens5 NetworK iNTERFACE
awk '
    /args:/ {
        print;
        while ((getline line) > 0) {
            print line;
            if (line ~ /--kube-subnet-mgr/) {
                print "        - '"$NEW_ARG"'";
                break;
            }
        }
        next;
    }
    { print }
' "$FILE" > tmp.yml && mv tmp.yml "$FILE"

echo "Modifications applied to $FILE:"
echo "1. Network updated to $POD_NETWORK in ConfigMap."
echo "2. Added $NEW_ARG to the args section in DaemonSet."


# Install The Flannel
kubectl apply -f kube-flannel.yml

