# Compile Plugin

1. Add idempiere credentials:

    In this step we are going to create a ssh credential for
    communicating both VMs.

    Copy the ssh private key:

    ```shell
    vagrant ssh idempiere -c "sudo cat /opt/idempiere-server/.ssh/idempiere" | clipcopy
    ```

    Go to <http://localhost:9090/manage/credentials/store/system/domain/_/newCredentials>.

    In `Kind` select `SSH Username with private key`.

    Set `idempiere` in the fields `ID` and `Username`.

    Click on `Private Key` > `Enter directly` > `Add`, and paste the ssh private key.

    Finally, click on `Create`.

2. Add a new pipeline:

    On the Jenkins' landing page <http://localhost:9090/>, click on `New Item` and put `Plugin Example` as name.

    Then select `Multibranch Pipeline` and click on `OK`.

    Scroll down onto `Branch Sources`.

    Click on `Add source` > `Git`.

    Put `https://github.com/idempiere-devops/idempiere-unit-test-sandbox.git` on `Project Repository`.

    Select `Clean before checkout` in `Behaviors` > `Add` and check `Delete untracked nested repositories`.

    Finally click on `Save`.
