FROM openjdk:8
ADD target/osoma.jar osoma.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "osoma.jar"]