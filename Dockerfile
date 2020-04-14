FROM openjdk:8
ADD target/osoma.jar osoma.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "osoma.jar"]