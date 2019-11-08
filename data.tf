data "template_file" "body" {
  template = var.body

  vars = var.vars
}

data "template_file" "subject" {
  template = var.subject

  vars = var.vars
}
