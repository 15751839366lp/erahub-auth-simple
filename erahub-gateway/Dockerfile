#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/gateway
RUN mkdir -p /erahub/gateway/logs
RUN mkdir -p /erahub/gateway/temp

WORKDIR /erahub/gateway

ENV SERVER_PORT=8080

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-gateway.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
