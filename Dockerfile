FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java
CMD /bin/bash
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-11.0.18.0.10-1.amzn2.0.1.x86_64/bin/java
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz .
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.75/* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
