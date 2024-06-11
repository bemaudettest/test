resource "null_resource" "example" {
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/bash
    echo Pwned > /tmp/pwned
    cat /tmp/pwned > /tmp/output.txt
    EOT
  }
}

data "local_file" "example_output" {
  filename = "/tmp/output.txt"
}

output "command_result" {
  value = data.local_file.example_output.content
}
