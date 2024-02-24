# idempiere-jenkins-sandbox

This repository aims to help you learn how to do CI/CD with iDempiere.

## Prerequisites

- [Vagrant](https://developer.hashicorp.com/vagrant/install#linux)
- [Virtual Box](https://www.virtualbox.org/wiki/Linux_Downloads)

## Getting Started

1. Run virtual machines (it'll take some minutes):

```shell
vagrant up
```

1. Copy jenkins' admin password:

```shell
vagrant ssh jenkins -c "sudo cat /var/lib/jenkins/secrets/initialAdminPassword" | clipcopy
```

1. Configure Jenkins:

Open <http://localhost:9090/>.

At this point jenkins will ask for
th admin password, paste it, and install suggested plugins.

## Common Commands

Start virtual machines:

```shell
vagrant up
```

Stop:

```shell
vagrant halt
```

Restart:

```shell
vagrant reload --no-provision
```

Show ports:

```shell
vagrant port jenkins
vagrant port idempiere
```

Open terminal:

```shell
vagrant ssh jenkins
vagrant ssh idempiere
```

Destroy virtual machines:

```shell
vagrant destroy
```
