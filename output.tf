output "users" {
  description = "PagerDuty Users"
  value       = { for name, user in pagerduty_user.user : name => user.id }
}

output "teams" {
  description = "PagerDuty Teams"
  value       = { for name, team in pagerduty_team.team : name => team.id }
}

output "team_memberships" {
  description = "PagerDuty Team Memberships"
  value = { for key, member in pagerduty_team_membership.member : key => {
    user_id = member.user_id
    team_id = member.team_id
  } }
}