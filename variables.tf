variable "body" {
  description = "Email body template"
  type = string
}

variable "enabled" {
  default     = true
  description = "Flag to enable or disable the sending of emails"
  type        = bool
}

variable "from" {
  default = "devops@union-pos.com"
  description = "From address for email"
  type = string
}

variable "subject" {
  description = "Email subject template"
  type = string
}

variable "to" {
  description = "Email recipients"
  type        = list(string)
}

# We recommend the following tool:
#   https://github.com/wrouesnel/emailcli
variable "mail_command" {
  default     = "email"
  description = "Command to execute"
  type        = string
}

variable "vars" {
  description = "Parameters to pass to the body template"
  default     = {}
  type        = map(string)
}
