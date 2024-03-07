FROM registry.access.redhat.com/ubi9/openjdk-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM registry.access.redhat.com/ubi9/openjdk-17
WORKDIR /home/default
COPY --from=build /app/target/spring-petclinic-3.1.0-SNAPSHOT.jar app.jar
CMD ["java","-jar","app.jar"]
