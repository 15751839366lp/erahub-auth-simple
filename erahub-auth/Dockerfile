#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/auth/logs  \
    /erahub/auth/temp  \
    /erahub/skywalking/agent

WORKDIR /erahub/auth

ENV SERVER_PORT=9210

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-auth.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=erahub-auth", \
#            "-javaagent:/erahub/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
