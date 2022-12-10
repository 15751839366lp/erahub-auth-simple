#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/xxl-job-admin/logs \
    /erahub/skywalking/agent

WORKDIR /erahub/xxl-job-admin

ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 9900

ADD ./target/erahub-xxl-job-admin.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
#            "-Dskywalking.agent.service_name=erahub-xxl-job-admin", \
#            "-javaagent:/erahub/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
