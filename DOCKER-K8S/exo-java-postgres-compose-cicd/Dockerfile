FROM eclipse-temurin:25.0.4_7-jre

WORKDIR /app

COPY ./target/*.jar hello.jar

CMD [ "java", "-jar", "hello.jar" ]

EXPOSE 80
