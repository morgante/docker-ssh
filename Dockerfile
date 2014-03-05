FROM 		ubuntu:12.04

MAINTAINER	Morgante "http://morgante.net"

RUN 		echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list
RUN 		apt-get update -y
RUN 		apt-get install -y openssh-server

RUN 		mkdir /root/.ssh
RUN 		mkdir /var/run/sshd

# Add our own SSH config
ADD 		ssh.conf /etc/ssh/sshd_config

# NOTE: change this key to your own
ADD 		id_rsa.pub /root/.ssh/authorized_keys
RUN 		chown root:root /root/.ssh/authorized_keys

EXPOSE		22
ENTRYPOINT	["/usr/sbin/sshd"]
CMD			["-D"]