variable "countt" {
  type = number
}

resource "null_resource" "example" {
  count = "${var.countt}"
  provisioner "local-exec" {
    command = "echo testlocallocaltesttestlocallocaltes"
  }
}
