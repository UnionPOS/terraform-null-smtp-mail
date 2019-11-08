locals {
  body    = data.template_file.body.rendered
  subject = data.template_file.subject.rendered
  command = "${var.mail_command} ${join(" ", var.to)}"
}

resource "null_resource" "default" {
  count = var.enabled ? 1 : 0

  triggers = {
    subject = local.subject
    body    = local.body
    command = local.command
  }

  provisioner "local-exec" {
    command = local.command

    environment = {
      // commented vars should be provided by container env
      // EMAIL_CACERT
      // EMAIL_CONCURRENT_SENDS (default 1)
      EMAIL_BODY     = local.body
      EMAIL_FROM     = var.from
      // EMAIL_HOST     = var.email_host
      // EMAIL_INSECURE (default false)
      // EMAIL_PASSWORD = var.email_password
      // EMAIL_PORT     = var.email_port
      EMAIL_SUBJECT  = local.subject
      // EMAIL_USERNAME = var.email_username
      // EMAIL_TIMEOUT
      // EMAIL_TLSHOST (default to host if empty)
      // EMAIL_USETLS
    }

    on_failure = fail
  }

  depends_on = [
    data.template_file.body,
    data.template_file.subject,
  ]
}
