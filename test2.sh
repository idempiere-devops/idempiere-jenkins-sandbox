#!/bin/bash

set -e

if ! id idempiere > /dev/null 2>&1; then
    echo "User idempiere not found"
    useradd --create-home -s /bin/bash idempiere
fi

mkdir -p /home/idempiere/.ssh
cp -r /vagrant/.ssh/idempiere* /home/idempiere/.ssh
cp /vagrant/.ssh/jenkins.pub /home/idempiere/.ssh/authorized_keys

chown -R idempiere:idempiere /home/idempiere/.ssh
chmod 755 /home/idempiere/.profile
chmod 700 /home/idempiere/.ssh
chmod 600 /home/idempiere/.ssh/idempiere
chmod 644 /home/idempiere/.ssh/idempiere.pub
chmod 644 /home/idempiere/.ssh/authorized_keys
