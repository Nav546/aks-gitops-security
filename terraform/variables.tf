variable "location" {
  type    = string
  default = "australiaeast"
}

variable "prefix" {
  type    = string
  default = "aksgitops"
}

variable "node_vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "node_count" {
  type    = number
  default = 1
}
