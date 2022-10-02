#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/resource
RUN mkdir -p /erahub/resource/logs
RUN mkdir -p /erahub/resource/temp

WORKDIR /erahub/resource

ENV SERVER_PORT=9204

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-resource.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
