#!/bin/bash

set -e

wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | \
    tee /etc/apt/sources.list.d/jenkins.list > /dev/null

apt update -y
apt install -y fontconfig openjdk-17-jdk-headless
apt install -y jenkins
usermod -aG docker jenkins
systemctl enable jenkins
systemctl start jenkins