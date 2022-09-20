#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/auth
RUN mkdir -p /erahub/auth/logs
RUN mkdir -p /erahub/auth/temp

WORKDIR /erahub/auth

ENV SERVER_PORT=9200

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-auth.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
