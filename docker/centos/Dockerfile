FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install wget passwd python java-1.8.0-openjdk initscripts && yum clean all

RUN wget -O /etc/yum.repos.d/cjt.repo https://downloads.cloudbees.com/cjt/rolling/rpm/cjt.repo
RUN rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&fingerprint=on&search=0x38E2F5F39FF90BDA"
RUN yum -y update && yum -y install cjt

EXPOSE 8080

CMD service cjt start && exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"