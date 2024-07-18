#!/bin/bash
rm -rf dockerimage
mkdir dockerimage
cd dockerimage
cp /home/ubuntu/JavaApp/workspace/JavaPipeline/target/NemoAapp-1.0-SNAPSHOT.jar .
touch dockerfile
cat <<EOT>> dockerfile
FROM nginx:latest
COPY ./NemoAapp-1.0-SNAPSHOT.jar /usr/share/nginx/html/index.html
CMD ["dockerimage.sh", "run"]
EXPOSE 8080
EOT
docker build -t webimage:1.0 .
docker container run -itd --name webserver -p 8888:8080 webimage:1.0