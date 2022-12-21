#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/business/logs \
    /erahub/business/temp \
    /erahub/skywalking/agent

WORKDIR /erahub/business

ENV SERVER_PORT=9205

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-business.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=erahub-business", \
#            "-javaagent:/erahub/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
