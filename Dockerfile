FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/employee-portal.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
