# Add an Agent

1. Add a new credential:

    In this step we are going to create a ssh credential for
    communicating both VMs.

    Copy the ssh private key:

    ```shell
    vagrant ssh idempiere -c "sudo cat /home/jenkins/.ssh/jenkins" | clipcopy
    ```

    Go to <http://localhost:9090/manage/credentials/store/system/domain/_/newCredentials>.

    In `Kind` select `SSH Username with private key`.

    Set `jenkins` in the fields `ID` and `Username`.

    Click on `Private Key` > `Enter directly` > `Add`, and paste the ssh private key.

    Finally, click on `Create`.

2. Create agent:

    Go to <http://localhost:9090/computer/new>.

    Set `idempiere` to `Node name`, check `Permanent Agent`, and click on `Create`.

    Set `/home/jenkins/agent` in the `Remote root directory` field.

    Set `idempiere` to `Labels`.

    Select `Only build jobs with label expressions matching this node` in the `Usage` field.

    Select `Launch agents via SSH` under `Launch method`.

    Set `192.168.56.20` in `Host` (or the idempiere vm's ip).

    Select `jenkins` in the `Credentials` field.

    Select `Non verifying Verification Strategy` in the `Host Key Verification Strategy` field.

    Finally, click on `Save` (it'll take some seconds to deploy the new agent).

3. Create a test pipeline:

    On the Jenkins' landing page <http://localhost:9090/>, click on `New Item` and put `Test iDempiere Node` as name.

    Then select `Pipeline` and click on `OK`.

    Scroll down onto `Script`, and paste next code:

    ```groovy
    pipeline {
        agent {
            node { label 'idempiere' }
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

> [Next >](4_COMPILE_AND_DEPLOY_A_PLUGIN.md)
