# idempiere-jenkins-sandbox

This repository aims to help you learn how to do CI/CD with iDempiere.

## Prerequisites

- [Vagrant](https://developer.hashicorp.com/vagrant/install#linux)
- [Virtual Box](https://www.virtualbox.org/wiki/Linux_Downloads)

## Getting Started: Jenkins

1. Run the virtual machine (it'll take some minutes):

    ```shell
    vagrant up jenkins
    ```

2. Copy jenkins' admin password:

    ```shell
    vagrant ssh jenkins -c "sudo cat /var/lib/jenkins/secrets/initialAdminPassword" | clipcopy
    ```

3. Configure Jenkins:

    Open <http://localhost:9090/>.

    At this point jenkins will ask you for
    the *Administrator password*, paste it, and install suggested plugins.

    Then, you have to create the *First Admin User*.

4. Install Docker Plugins:

    Go to <http://localhost:9090/manage/pluginManager/available>.

    Search for **Docker**.

    Install the plugins: `Docker` and `Docker Pipeline`.

    When it finishes, run:

    ```shell
    vagrant reload jenkins --no-provision
    ```

5. Create a `test` pipeline:

    On the Jenkins' landing page <http://localhost:9090/>, click on *New Item* and put a name (ex: **test**).

    Then select *Pipeline* and click on *OK*.

    Scroll down onto *Script*, and paste next code:

    ```groovy
    pipeline {
        agent {
            docker { image 'amazoncorretto:17' }
        }

        stages {
            stage('Build') {
                steps {
                    echo 'Hello World!'
                    sh 'java --version'
                }
            }
        }
    }
    ```

    Then click on *Save*.

    Finally, click on *Build Now*.

## Getting Started: iDempiere

1. Run the virtual machine (it'll take some minutes):

    ```shell
    vagrant up idempiere
    ```

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
