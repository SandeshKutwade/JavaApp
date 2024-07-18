FROM nginx:latest
EXPOSE 8080
COPY /home/ubuntu/JavaApp/workspace/JavaPipeline/target/NemoAapp-1.0-SNAPSHOT.jar /usr/share/nginx/html/NemoAapp-1.0-SNAPSHOT.jar
CMD ["java","jar","NemoAapp-1.0-SNAPSHOT.jar" ]