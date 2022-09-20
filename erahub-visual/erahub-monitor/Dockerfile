#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/monitor
RUN mkdir -p /erahub/monitor/logs

WORKDIR /erahub/monitor

EXPOSE 9100

ADD ./target/erahub-monitor.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
