locals {
  user_team_combinations = {
    for combo in flatten([
      for user_name, user in var.users : [
        for team in user.teams : {
          user_name = user_name
          team_key  = team.team_key
          team_role = team.role
        }
      ]
    ]) : "${combo.user_name}-${combo.team_key}" => combo
  }
}

resource "pagerduty_user" "user" {
  for_each = var.users # { for user in var.users : user.name => user }

  name      = each.value.name
  email     = each.value.email
  job_title = each.value.job_title
  role      = each.value.role
  time_zone = each.value.time_zone
  color     = each.value.color

  depends_on = [pagerduty_team.team]
}

resource "pagerduty_user_contact_method" "user" {
  for_each = var.users

  user_id      = pagerduty_user.user[each.key].id
  type         = each.value.contact_type
  country_code = each.value.country_code
  address      = each.value.address
  label        = each.value.label
}

resource "pagerduty_team" "team" {
  for_each = var.teams

  name        = each.value.name
  description = each.value.description
}

resource "pagerduty_team_membership" "member" {
  for_each = local.user_team_combinations

  user_id = pagerduty_user.user[each.value.user_name].id
  team_id = pagerduty_team.team[each.value.team_key].id
  role    = each.value.team_role

  depends_on = [
    pagerduty_user.user,
    pagerduty_team.team
  ]
}


resource "pagerduty_schedule" "schedule" {
  for_each = var.schedules

  name      = each.value.name
  time_zone = each.value.time_zone
  teams = [
    for team in each.value.teams : pagerduty_team.team[team].id
  ]

  dynamic "layer" {
    for_each = each.value.layers
    content {
      name                         = layer.value.name
      start                        = layer.value.start
      rotation_virtual_start       = layer.value.rotation_virtual_start
      rotation_turn_length_seconds = layer.value.rotation_turn_length_seconds

      users = [
        for user_name in layer.value.users : pagerduty_user.user[user_name].id
      ]

      restriction {
        type              = layer.value.restriction.type
        start_time_of_day = layer.value.restriction.start_time_of_day
        duration_seconds  = layer.value.restriction.duration_seconds
      }
    }
  }
}

resource "pagerduty_escalation_policy" "policy" {
  for_each = var.escalation_policies

  name      = each.value.name
  num_loops = each.value.num_loops
  teams     = [for t in each.value.teams : pagerduty_team.team[t].id]

  dynamic "rule" {
    for_each = each.value.rules
    content {
      escalation_delay_in_minutes = rule.value.escalation_delay_in_minutes

      dynamic "target" {
        for_each = rule.value.targets
        content {
          type = target.value.type
          id   = target.value.type == "user_reference" ? pagerduty_user.user[target.value.user_key].id : pagerduty_team.team[target.value.name].id
        }
      }
    }
  }
}