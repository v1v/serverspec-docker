FROM debian:latest

MAINTAINER Release Team <release-team@cloudbees.com>

RUN apt-get update && \
    apt-get install -y curl gnupg openjdk-8-jdk apt-utils apt-transport-https

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 38E2F5F39FF90BDA && \
    echo "deb https://downloads.cloudbees.com/cjt/rolling/debian binary/" >>  /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y cjt

EXPOSE 8080

CMD service cjt start && exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"