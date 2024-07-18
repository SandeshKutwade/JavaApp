FROM java:7
EXPOSE 8080
VOLUME /tmp
ADD NemoAapp-1.0-SNAPSHOT.jar  NemoAapp.jar
ENTRYPOINT [ "java","jar","NemoAapp.jar" ]