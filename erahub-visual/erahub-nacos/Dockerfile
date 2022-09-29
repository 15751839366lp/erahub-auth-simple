FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER erahub

RUN mkdir -p /erahub/nacos

WORKDIR /erahub/nacos

EXPOSE 8848

ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms256m -Xmx512m"

ADD ./target/erahub-nacos.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar", "${JAVA_OPTS}"]

