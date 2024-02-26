# Getting Started: Jenkins

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
    the `Administrator password`, paste it, and install suggested plugins.

    Then, you have to create the `First Admin User`.

4. Install Docker Plugins:

    Go to <http://localhost:9090/manage/pluginManager/available>.

    Search for `Docker`.

    Select: `Docker` and `Docker Pipeline`, and click on `Install`.

    Additional, on the installation page, check the option
    `Restart Jenkins when installation is complete and no jobs are running`, and wait until it finishes.

5. Create a `test` pipeline:

    On the Jenkins' landing page <http://localhost:9090/>, click on `New Item` and put `Test Docker` as name.

    Then select `Pipeline` and click on `OK`.

    Scroll down onto `Script`, and paste next code:

    ```groovy
    pipeline {
        agent {
            docker { image 'amazoncorretto:17' }
        }

        stages {
            stage('Test') {
                steps {
                    echo 'Hello World!'
                    sh 'java --version'
                }
            }
        }
    }
    ```

    Then click on `Save`.

    Finally, click on `Build Now`.
