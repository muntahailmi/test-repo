variable "project_id" {default = ""}
variable "region" {default = "us-central1"}
variable "zone" {default = "us-central1-b"}
resource "local_file" "foo" {
  content  = "example-test ${var.project_id}"
  filename = "tes.txt"
}
