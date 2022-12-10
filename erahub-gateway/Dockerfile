#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/gateway/logs  \
    /erahub/gateway/temp  \
    /erahub/skywalking/agent

WORKDIR /erahub/gateway

ENV SERVER_PORT=8080

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-gateway.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=erahub-gateway", \
#            "-javaagent:/erahub/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
