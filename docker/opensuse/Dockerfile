FROM opensuse:latest

RUN zypper update -y && \
    zypper -n install python sudo curl wget java-1_8_0-openjdk-devel aaa_base dejavu-fonts && \
    zypper clean -a

RUN zypper --no-gpg-checks --non-interactive addrepo -f http://downloads.cloudbees.com/jenkins-enterprise/rolling/opensuse/ cjt
RUN zypper --no-gpg-checks --non-interactive update
RUN zypper --non-interactive install jenkins

EXPOSE 8080

CMD /etc/init.d/jenkins start && exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"