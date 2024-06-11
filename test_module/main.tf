resource "null_resource" "example" {
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/bash
    echo Pwned2 > /tmp/pwned
    cat /tmp/pwned > /tmp/output.txt
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

data "local_file" "example_output" {
  filename = "/tmp/output.txt"
  depends_on = [null_resource.example]
}

output "command_result" {
  value = data.local_file.example_output.content
}
