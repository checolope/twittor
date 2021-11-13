FROM java:8

COPY target/demo-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 9524
ENTRYPOINT ["java","-jar" ,"/app.jar"]