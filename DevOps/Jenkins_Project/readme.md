# Project Oreview

This project demonstrates a CI/CD pipeline for automating the SDLC (software development lifecycle). It integrates with tools and services, such as Jenkins, GitLab, Docker, and Slack, to make sure efficient code delivery from development to production.

<a href='https://postimg.cc/Lg2Xwqdg' target='_blank'><img src='https://i.postimg.cc/sxZhBSwm/jenkins.png' border='0' alt='jenkins'/></a>



## Components

* **GitLab Repository** - Stores the source code and acts as the SCM, allows us to track our
 source code, Jenkinsfile, Dockerfile to use Pipeline as Code.
* **Jenkins (Master)** - Manages the CI/CD processes and build, test, and deployment pipelines. 
Also interact with Slack App.
* **Jenkins (Agent)** - Execute the pipeline and send feedback and logs to Jenkins Master.
* **DockerHub** - The world's largest container registry for storing, managing, and sharing Docker images.
 Used to save the weather-app image.
* **Production Server** - A instance where the application runs and available for users.
* **Slack Integration** - Sends pipeline notifications and alerts to the development team and DevOps Team.

# Workflow

<a href='https://postimg.cc/phRq4VwB' target='_blank'><img
 src='https://i.postimg.cc/4dhqKmwj/Screenshot-2024-11-23-at-14-16-30.png' 
 border='0' alt='Screenshot-2024-11-23-at-14-16-30'/></a><br />
<br />

###  1. Developer Commit
* Developers push code to the GitLab repository.
* A GitLab webhook triggers the Jenkins pipeline.


### 2. Clean
* Jenkins pulls the latest code from GitLab Repository.
* Jenkins clean the pipeline machine before start new pipeline.


### 3. Static Analysis
* Run Pylint on the code. score must be higher then 5 to
 continue in the pipeline

### 3. Build
* Docker builds the application image using the Dockerfile that in the GitLab repository.

### 3. Test
Automaticly run the new image using:
```
docker run -d --name weather-app -p 5000:5000 weather-app
```
Wait 3 seconds (sleep(3)) untill website will be reachable.
Run reachability test using:
```
# Fetch the public IP automatically
public_ip=$(curl -s http://checkip.amazonaws.com)

# Check if the URL is accessible
if wget -q --spider http://${public_ip}:5000/; then
    echo "Site Available"  # Success
else
    exit 1
fi
```


### 4. Push To DockerHub
* If tests pass, the Docker image is pushed to DockerHub for storage and reuse in another machines.


### Deploy To Production
* Jenkins deploys the latest image to the production server. Agent connect in SSH to production server and pull&run the image from DockerHub.
   

### Slack Notification
* The pipeline status and results are sent to Slack and available for developers and DevOps Teams.

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/8CyfFCsd/Screenshot-2024-11-23-at-14-17-38.png' border='0' alt='Screenshot-2024-11-23-at-14-17-38'/></a>



# Key Features
### Advantages
* **Automation** - Fully automated process from developer source code level to functional production server.
* **Scalability** - Designed to be scalability  to allow scaling stages when needed.
* **Notification System** - Slack integration to make sure developers and DevOps teams will be updated online about the build process.
* **Testing** - Static analysis and reachability test to make sure app is stable before deployment.

### Limitations
* **Single Point of Failure** - Jenkins master is a single point of failure in the automated process.
* **Testing Scope** - Current testing not cover all edge cases or functionality testing.



