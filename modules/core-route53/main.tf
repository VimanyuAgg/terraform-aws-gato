locals {
  prefix = "${var.prefix}-gato-core"
  common_tags   = merge(var.common_tags, {stack = "gato"})
}
