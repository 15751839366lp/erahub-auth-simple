#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/base/logs \
    /erahub/base/temp \
    /erahub/skywalking/agent

WORKDIR /erahub/base

ENV SERVER_PORT=9201

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-base.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=erahub-base", \
#            "-javaagent:/ruoyi/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
