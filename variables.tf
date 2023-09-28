variable "users" {
  description = "List of users to be created."
  type = map(object({
    name         = string
    email        = string
    job_title    = string
    role         = string
    time_zone    = string
    color        = string
    contact_type = string
    country_code = string
    address      = string
    label        = string

    teams = list(object({
      team_key = string
      role     = string
    }))

  }))
  default = {}
}

variable "teams" {
  description = "List of teams to be created."
  type = map(object({
    name        = string
    description = string
  }))
  default = {}
}

variable "schedules" {
  description = "List of schedules to be created."
  type = map(object({
    name      = string
    time_zone = string
    teams     = list(string)
    layers = map(object({
      name                         = string
      start                        = string
      rotation_virtual_start       = string
      rotation_turn_length_seconds = number
      users                        = list(string)
      restriction = object({
        type              = string
        start_time_of_day = string
        duration_seconds  = number
      })
    }))
  }))
  default = {}
}

variable "escalation_policies" {
  description = "List of escalation policies."
  type = map(object({
    name      = string
    num_loops = number
    teams     = list(string)
    rules = list(object({
      escalation_delay_in_minutes = number
      targets = list(object({
        type     = string
        user_key = string
      }))
    }))
  }))
  default = {}
}
