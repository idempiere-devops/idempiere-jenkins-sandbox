# Add New Agent

1. Connect both VMs through ssh:

    ```shell
    vagrant ssh jenkins -c "sudo cat /var/lib/jenkins/.ssh/jenkins.pub"
    ```

    ```shell
    vagrant ssh idempiere -c "sudo cat /home/idempiere/.ssh/idempiere.pub"
    ```

2. Add new credential:

    In this step we are going to create a ssh credential for the
    **idempiere vm**.

    Flirts, let's create a ssh key in the **idempiere vm**.

    Copy the ssh private key:

    ```shell
    vagrant ssh idempiere -c "sudo cat /home/idempiere/.ssh/idempiere" | clipcopy
    ```

    Go to <http://localhost:9090/manage/credentials/store/system/domain/_/newCredentials>.

    In *Kind* select *SSH Username with private key*.

    Set `idempiere` in the fields *ID* and *Username*.

    Click on *Private Key* > *Enter directly* > *Add*, and paste the ssh private key.

    Finally, click on *Create*.

3. Create agent:

    Go to <http://localhost:9090/computer/new>.

    Set *Node name* `idempiere`, check *Permanent Agent*, and click on *Create*.

    Set `/home/idempiere/jenkins` in the *Remote root directory*.

    Set `idempiere` in *Labels*.

    Select *Launch agents via SSH* at *Launch method*.

    Set `192.168.56.10` in *Host* (or the idempiere vm's ip).

    Select `idempiere` in *Credentials* field.

    Finally, click on *Save* (it'll take some time).
