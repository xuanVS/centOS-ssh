FROM centos:centos6

MAINTAINER ken <liuwxuan@gmail.com>

# Install packages and set up sshd
RUN yum -y update
RUN yum -y install openssh-server
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# change root password
RUN rpm -i http://dl.fedoraproject.org/pub/epel/6/x86_64/pwgen-2.06-5.el6.x86_64.rpm
RUN echo 'root:superadmin' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
