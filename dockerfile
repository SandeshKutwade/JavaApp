# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# The application's jar file
ARG JAR_FILE=target/hello-world-app-1.0.0.jar

# Add the application's jar to the container
ADD ${JAR_FILE} app.jar

# Run the jar file
ENTRYPOINT ["java","-jar","/app.jar"]