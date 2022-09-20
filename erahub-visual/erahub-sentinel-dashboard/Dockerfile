#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/sentinel-dashboard
RUN mkdir -p /erahub/sentinel-dashboard/logs

WORKDIR /erahub/sentinel-dashboard

EXPOSE 8718

ADD ./target/erahub-sentinel-dashboard.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
