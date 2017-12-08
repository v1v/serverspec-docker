FROM fedora:latest

MAINTAINER Release Team <release-team@cloudbees.com>

RUN dnf -y update && dnf -y install openssh-server passwd python yum java-1.8.0-openjdk initscripts && dnf clean all

RUN dnf -y install wget

RUN wget -O /etc/yum.repos.d/cjt.repo https://downloads.cloudbees.com/cjt/rolling/rpm/cjt.repo
RUN rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&fingerprint=on&search=0x38E2F5F39FF90BDA"
RUN dnf -y update && dnf -y install cjt

EXPOSE 8080

CMD service cjt start && exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"