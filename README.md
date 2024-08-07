# Ensure Docker Socket Permissions:

Make sure the Docker socket has the correct permissions on the host:

sudo chmod 666 /var/run/docker.sock

# Run the container using the custom image
docker run \
  --privileged \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --name jenkins \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /home/jenkins_home:/var/jenkins_home \
  josh1991/my-jenkins:latest

# Use the docker exec command to start a shell session inside the running container.

docker exec -it <container_name> /bin/bash

# Check the Current User:
Once you are inside the container, you can check the current user by running:

whoami

# Verify Docker Access 
su - jenkins
docker ps
