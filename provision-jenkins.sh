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
