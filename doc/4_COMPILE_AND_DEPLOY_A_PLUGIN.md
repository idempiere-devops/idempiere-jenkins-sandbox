# Compile Plugin

1. Add a new pipeline:

    On the Jenkins' landing page <http://localhost:9090/>, click on `New Item` and put `Plugin Example` as name.

    Then select `Multibranch Pipeline` and click on `OK`.

    Scroll down onto `Branch Sources`.

    Click on `Add source` > `Git`.

    Put `https://github.com/idempiere-devops/idempiere-unit-test-sandbox.git` on `Project Repository`.

    Select `Clean before checkout` in `Behaviors` > `Add` and check `Delete untracked nested repositories`.

    Finally click on `Save`.
