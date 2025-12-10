resource "aws_ecr_repository" "app" {
  name                 = local.resource_prefix
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  tags                 = merge(local.common_tags, { Name = "${local.resource_prefix}-ecr" })
}
