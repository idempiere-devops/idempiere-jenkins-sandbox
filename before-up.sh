#!/bin/bash

set -e

mkdir -p .ssh

if [[ ! -f .ssh/idempiere ]]; then
    ssh-keygen -t ed25519 -f .ssh/idempiere -N ''
fi

if [[ ! -f .ssh/jenkins ]]; then
    ssh-keygen -t ed25519 -f .ssh/jenkins -N ''
fi
