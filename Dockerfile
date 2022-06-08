FROM openjdk:8
EXPOSE <port>
ADD target/<yourfile>.jar app.jar
ENTRYPOINT [ "java" , "-jar" , "/app.jar"]