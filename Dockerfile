FROM centos:centos7
MAINTAINER Viacheslav Pryimak <vpryimak@intropro.com>


################## BEGIN INSTALLATION ######################
RUN yum -y update && yum clean all && \
    yum -y install epel-release && yum clean all && \
    yum -y install mariadb-server.x86_64 mariadb.x86_64 bind-utils supervisor net-tools hostname &&\
    yum clean all
##################### INSTALLATION END #####################

ADD ./mariadb.sh /mariadb.sh
RUN chmod +x /mariadb.sh
RUN /mariadb.sh
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3306

ENTRYPOINT ["/start.sh"]