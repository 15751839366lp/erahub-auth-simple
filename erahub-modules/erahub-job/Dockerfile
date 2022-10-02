#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/job
RUN mkdir -p /erahub/job/logs
RUN mkdir -p /erahub/job/temp

WORKDIR /erahub/job

ENV SERVER_PORT=9203

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-job.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
