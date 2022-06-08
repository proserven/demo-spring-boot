FROM openjdk:8
EXPOSE 8082
ADD target/demospringboot.jar app.jar
ENTRYPOINT [ "java" , "-jar" , "/app.jar"]