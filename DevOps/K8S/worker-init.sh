################################################################################
#                                                                              #
#                      Kubernetes Worker Node Setup Script                     #
#                                                                              #
#  Created by: Or Toledano                                                     #
#                                                                              #
#  Main Usage:                                                                 #
#  - Initializes a Kubernetes Worker Node                                      #
#  - Configures containerd as Container Runtime                                #
#  - Run The Join Command from the kubeadm-join-command.txt in CP Node         #
#                                                                              #
#  Prerequisites:                                                              #
#  - Ubuntu OS 22.04                                                           #
#  - Root or sudo privileges                                                   #
#  - 1vCPU and 2GB RAM                                                         #
#                                                                              #
#  Note: Run this Script on The Worker Node                                    #
#                                                                              #
################################################################################


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

sudo modprobe br_netfilter
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -p

# Make Sure br_netfilter Will Up at Boot
echo "br_netfilter" | sudo tee -a /etc/modules
