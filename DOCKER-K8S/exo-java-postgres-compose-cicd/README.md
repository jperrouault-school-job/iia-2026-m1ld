Créer un docker compose
> Application java
--> image eclipse-temurin:25.0.4_7-jre
--> le fichier target/*.jar est à utiliser
--> la commande a exécuter est java -jar fichier.jar
--> le port sera 8080
--> Variables
- SPRING_DATASOURCE_URL: jdbc:postgresql://db/nom_db
- SPRING_DATASOURCE_USERNAME: username
- SPRING_DATASOURCE_PASSWORD: password

> flyway
--> Migration DB

> postgres
--> Healthcheck : test: [ "CMD", "pg_isready", "-U", "nom_user_postgres" ]


Créer la pipeline CICD
> Build app java (image maven:3.9.16-eclipse-temurin-25)
--> mvn package -DskipTests
--> Utiliser un artifacts

  artifacts:
    paths:
      - target/*.jar

    expire_in: 1 hour

----


> Build Docker


> Deploy Docker Compose
