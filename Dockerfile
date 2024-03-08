FROM registry.access.redhat.com/ubi9/openjdk:17.0.2-jdk as build
WORKDIR /home/jboss
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

FROM registry.access.redhat.com/ubi9/openjdk:17.0.2-jdk
WORKDIR /home/jboss
COPY --from=build /home/jboss/spring-petclinic-3.1.0-SNAPSHOT.jar app.jar
CMD ["java","-jar","app.jar"]
