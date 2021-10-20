FROM maven:3.6.3-openjdk-8 as builder

# Create app directory
WORKDIR /usr/src/app

COPY ./complete/pom.xml .

RUN mvn dependency:go-offline

COPY ./complete/src ./src

RUN mvn package


FROM openjdk:8-jre-alpine

# Create app directory

ENV APP_NAME test_app

WORKDIR /usr/src/app

EXPOSE 8080

# Java 8
#ENV JAVA_OPT="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

# Java 9+
#ENV JAVA_OPT="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"


COPY --from=builder /usr/src/app/target/*.jar /usr/src/app/$APP_NAME.jar

RUN chmod +x /usr/src/app/$APP_NAME.jar

CMD java $JAVA_OPTS -jar $APP_NAME.jar
