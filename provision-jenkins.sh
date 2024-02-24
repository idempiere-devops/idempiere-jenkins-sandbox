#!/bin/bash

set -e

wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | tee \
    /etc/apt/sources.list.d/jenkins.list >/dev/null

apt-get update -y
apt-get install -y fontconfig openjdk-17-jre
apt-get install -y jenkins

systemctl enable jenkins
