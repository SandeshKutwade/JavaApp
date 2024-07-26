#!/bin/bash
password="Sid12233#"
username="sandeshkutwade6@gmail.com"

update(){
    sudo apt update 
    sudo apt install openjdk-17-jdk -y
}

dockerinstall(){
    curl -fsSL https://get.docker.com -o install-docker.sh
    sh install-docker.sh

}

sudodocker(){
    sudo chown ubuntu /var/run/docker.sock
}
dockerlogin(){
    echo "$password" | docker login -u "$username" --password-stdin
}


if update; then
    echo "Updae Funtion Successfully Completed"
    
    if dockerinstall; then
        echo "Docker Installation Completed"

        sudodocker
        echo "Running Sudodocker Final Function"
    else
        echo "Docker Installation fails"
    fi 
else 
    echo "Update funtion fails"
fi

