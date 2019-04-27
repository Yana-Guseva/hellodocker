FROM java:8
COPY /target/hellodocker-1.0-SNAPSHOT.jar hellodocker.jar
EXPOSE 8080
CMD java -jar hellodocker.jar