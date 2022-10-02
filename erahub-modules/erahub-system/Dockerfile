#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/system
RUN mkdir -p /erahub/system/logs
RUN mkdir -p /erahub/system/temp

WORKDIR /erahub/system

ENV SERVER_PORT=9201

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-system.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
