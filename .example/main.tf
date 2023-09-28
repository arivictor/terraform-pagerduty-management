module "pagerduty" {
  source = "../"

  teams               = var.teams
  users               = var.users
  schedules           = var.schedules
  escalation_policies = var.escalation_policies
}