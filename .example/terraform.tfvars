users = {
  "john_smith" = {
    name         = "John Smith"
    email        = "jsmith@arilaverty.com"
    job_title    = "Terraformer"
    role         = "limited_user"
    time_zone    = "Australia/Melbourne"
    color        = "blue"
    contact_type = "phone_contact_method"
    country_code = "+61"
    address      = "400000000"
    label        = "Mobile"
    teams = [
      {
        team_key = "terraformers"
        role     = "responder"
      }
    ]
  }
}

teams = {
  "terraformers" = {
    name        = "Terraformers"
    description = "Terraform Engineering"
  }
}

schedules = {
  "first_line" = {
    name      = "First Line"
    time_zone = "Europe/London"
    teams = [
      "terraformers"
    ]
    layers = {
      "initial" = {
        name                         = "Initial"
        start                        = "2023-05-19T21:30:00Z"
        rotation_virtual_start       = "2023-05-19T21:30:00Z"
        rotation_turn_length_seconds = 604800
        restriction = {
          type              = "daily_restriction"
          start_time_of_day = "08:00:00"
          duration_seconds  = 32400
        }
        users = [
          "john_smith"
        ]
      }

    }
  }
}

escalation_policies = {
  "eng_esc_policy" = {
    name      = "Engineering Escalation Policy"
    num_loops = 2
    teams     = ["terraformers"]
    rules = [
      {
        escalation_delay_in_minutes = 10
        targets = [
          {
            type     = "user_reference"
            user_key = "john_smith"
          }
        ]
      }
    ]
  }
}