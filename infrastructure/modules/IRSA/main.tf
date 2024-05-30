module "irsa_for_load_balancer" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "task2-irsa-for-LB"

  role_policy_arns = {
    policy = var.policy_arn
  }

  attach_load_balancer_controller_policy = true

  oidc_providers = {
    one = {
      provider_arn               = var.oidc_provider
      namespace_service_accounts = ["vegait-training:load-balancer"]
    }
  }
}