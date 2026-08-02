# ===============================
# Stage 1 - Build WAR using Maven
# ===============================
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# ===============================
# Stage 2 - Run on Tomcat
# ===============================
FROM tomcat:10.1-jdk17

# Default apps remove
RUN rm -rf /usr/local/tomcat/webapps/*

# WAR copy from build stage
COPY --from=build /app/target/SmartFeedbackManagementSystem.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]