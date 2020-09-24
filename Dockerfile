FROM centos

MAINTAINER pallavi23022@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN yum install net-tools
RUN yum -y install telnet
RUN sudo apt-get install vim

ENV role app
ENV env dev
ENV name pallavi

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://osdn.net/projects/pal/downloads/17479/helloworld.war/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]