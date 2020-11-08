#FROM java:8
#传进来文件名，将文件拷贝到docker中起名叫app.jar 暴露端口，运行 java -jar app.jar

FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
EXPOSE 10086
ENTRYPOINT ["java","-jar","/app.jar"]