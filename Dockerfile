# Base Image
FROM tomcat:10.1-jdk17

# Default Tomcat webapps hata do
RUN rm -rf /usr/local/tomcat/webapps/*

# Maven se bani WAR file copy karo
COPY target/SmartFeedbackManagementSystem.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat ka port
EXPOSE 8080

# Tomcat start karo
CMD ["catalina.sh", "run"]