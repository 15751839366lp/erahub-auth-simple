#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/gen
RUN mkdir -p /erahub/gen/logs

WORKDIR /erahub/gen

ENV SERVER_PORT=9202

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-gen.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
