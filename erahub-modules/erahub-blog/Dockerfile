#FROM anapsix/alpine-java:8_server-jre_unlimited
FROM ibm-semeru-runtimes:open-8-jre

MAINTAINER erahub

RUN mkdir -p /erahub/blog/logs \
    /erahub/blog/temp \
    /erahub/skywalking/agent

WORKDIR /erahub/blog

ENV SERVER_PORT=9204

EXPOSE ${SERVER_PORT}

ADD ./target/erahub-blog.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=erahub-blog", \
#            "-javaagent:/erahub/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
