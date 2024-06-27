FROM centos:7
COPY yum install net-tools -y
COPY yuminstall java-11-openjdk -y
COPY apache-maven-3.9.2-bin.tar.gz /tmp
WORKDIR /tmp
RUN  tar -xvzf apache-maven-3.9.2-bin.tar.gz
ENV MAVEN_HOME=/tmp/apache-maven-3.9.2-bin.tar.gz
ENV PATH=/tmp/apache-maven=3.9.2/bin/:$PATH
