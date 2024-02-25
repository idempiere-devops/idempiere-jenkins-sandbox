#!/bin/bash

set -e

# INSTALL DEPENDENCIES

wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

apt update -y
apt install -y fontconfig openjdk-17-jdk-headless
apt install -y jenkins

# CONFIGURE DOCKER

usermod -aG docker jenkins

# RESTART JENKINS

systemctl enable jenkins
systemctl restart jenkins

# CONFIGURE SSH

jenkins_home=/var/lib/jenkins

if [ ! -f /var/lib/jenkins/.ssh ]; then
    su jenkins -c "mkdir $jenkins_home/.ssh"
fi

cp -r /vagrant/.ssh/jenkins* $jenkins_home/.ssh
chown -R jenkins:jenkins $jenkins_home/.ssh
chmod 700 $jenkins_home/.ssh
chmod 600 $jenkins_home/.ssh/jenkins
chmod 644 $jenkins_home/.ssh/jenkins.pub
