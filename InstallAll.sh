#!/bin/bash

updatemachine(){
    echo "Updating Machine"
    sleep 4
    sudo apt update
    sudo apt install openjdk-17-jdk -y
}

installjenkins(){
    echo "installing jenkins"
    sleep 5
    echo "jenkins installtion..."
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins -y
}

installmaven(){
    echo "installing maven"
    sleep 5
    cd /tmp
    wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
    tar -xvf apache-maven-3.9.6-bin.tar.gz
    sudo mv apache-maven-3.9.6 /opt/maven
}
installdocker() {
    echo "installing docker"
    sleep 5
    curl -fsSL https://get.docker.com -o install-docker.sh
    sh install-docker.sh
    sudo chown ubuntu /var/run/docker.sock
}

jenkinssudo(){
    echo "adding Jenkins to the Docker Group"
    sudo usermod -aG docker jenkins 
    sudo systemctl restart jenkins.service 
}



updatemachine
installjenkins
installmaven
installdocker
jenkinssudo
