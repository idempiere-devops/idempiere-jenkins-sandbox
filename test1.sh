#!/bin/bash

set -e

if ! id jenkins > /dev/null 2>&1; then
    echo "User jenkins not found"
    useradd --create-home -s /bin/bash jenkins
fi

mkdir -p /home/jenkins/.ssh
cp -r /vagrant/.ssh/jenkins* /home/jenkins/.ssh

cat << EOF > /home/jenkins/.ssh/known_hosts
192.168.56.20 $(cat /vagrant/.ssh/idempiere.pub)
EOF

cat << EOF > /home/jenkins/.bash_aliases
echo "Starting ssh agent"
eval "\$(ssh-agent)"
ssh-add /home/jenkins/.ssh/jenkins
EOF

chown -R jenkins:jenkins /home/jenkins/.ssh
chmod 755 /home/jenkins/.profile
chmod 700 /home/jenkins/.ssh
chmod 600 /home/jenkins/.ssh/jenkins
chmod 644 /home/jenkins/.ssh/jenkins.pub
chmod 644 /home/jenkins/.ssh/known_hosts

