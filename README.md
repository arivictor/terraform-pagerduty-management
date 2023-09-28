<!-- BEGIN_TF_DOCS -->

#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement_pagerduty) | >= 3.0.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_pagerduty"></a> [pagerduty](#provider_pagerduty) | 3.0.1 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [pagerduty_escalation_policy.policy](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/escalation_policy) | resource |
| [pagerduty_schedule.schedule](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/schedule) | resource |
| [pagerduty_team.team](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/team) | resource |
| [pagerduty_team_membership.member](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/team_membership) | resource |
| [pagerduty_user.user](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/user) | resource |
| [pagerduty_user_contact_method.user](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/user_contact_method) | resource |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_escalation_policies"></a> [escalation_policies](#input_escalation_policies) | List of escalation policies. | <pre>map(object({<br>    name      = string<br>    num_loops = number<br>    teams     = list(string)<br>    rules = list(object({<br>      escalation_delay_in_minutes = number<br>      targets = list(object({<br>        type     = string<br>        user_key = string<br>      }))<br>    }))<br>  }))</pre> |
| <a name="input_schedules"></a> [schedules](#input_schedules) | List of schedules to be created. | <pre>map(object({<br>    name      = string<br>    time_zone = string<br>    teams     = list(string)<br>    layers = map(object({<br>      name                         = string<br>      start                        = string<br>      rotation_virtual_start       = string<br>      rotation_turn_length_seconds = number<br>      users                        = list(string)<br>      restriction = object({<br>        type              = string<br>        start_time_of_day = string<br>        duration_seconds  = number<br>      })<br>    }))<br>  }))</pre> |
| <a name="input_teams"></a> [teams](#input_teams) | List of teams to be created. | <pre>map(object({<br>    name        = string<br>    description = string<br>  }))</pre> |
| <a name="input_users"></a> [users](#input_users) | List of users to be created. | <pre>map(object({<br>    name         = string<br>    email        = string<br>    job_title    = string<br>    role         = string<br>    time_zone    = string<br>    color        = string<br>    contact_type = string<br>    country_code = string<br>    address      = string<br>    label        = string<br><br>    teams = list(object({<br>      team_key = string<br>      role     = string<br>    }))<br><br>  }))</pre> |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_team_memberships"></a> [team_memberships](#output_team_memberships) | PagerDuty Team Memberships |
| <a name="output_teams"></a> [teams](#output_teams) | PagerDuty Teams |
| <a name="output_users"></a> [users](#output_users) | PagerDuty Users |

## Contributing
Please read the [contributing](CONTRIBUTING.md) guide to get started.
<!-- END_TF_DOCS -->