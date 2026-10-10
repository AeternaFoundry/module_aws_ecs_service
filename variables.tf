variable "ecs_services" {
  description = <<EOT
Map of ecs_services, attributes below
Required:
    - name
Optional:
    - availability_zone_rebalancing
    - cluster
    - deployment_maximum_percent
    - deployment_minimum_healthy_percent
    - desired_count
    - enable_ecs_managed_tags
    - enable_execute_command
    - force_delete
    - force_new_deployment
    - health_check_grace_period_seconds
    - iam_role
    - launch_type
    - platform_version
    - propagate_tags
    - region
    - scheduling_strategy
    - sigint_rollback
    - tags
    - tags_all
    - task_definition
    - triggers
    - wait_for_steady_state
    - alarms (block):
        - alarm_names (required)
        - enable (required)
        - rollback (required)
    - capacity_provider_strategy (block):
        - base (optional)
        - capacity_provider (required)
        - weight (optional)
    - deployment_circuit_breaker (block):
        - enable (required)
        - rollback (required)
    - deployment_configuration (block):
        - bake_time_in_minutes (optional)
        - canary_configuration (optional, block):
            - canary_bake_time_in_minutes (optional)
            - canary_percent (optional)
        - lifecycle_hook (optional, block):
            - hook_details (optional)
            - hook_target_arn (required)
            - lifecycle_stages (required)
            - role_arn (required)
        - linear_configuration (optional, block):
            - step_bake_time_in_minutes (optional)
            - step_percent (optional)
        - strategy (optional)
    - deployment_controller (block):
        - type (optional)
    - load_balancer (block):
        - advanced_configuration (optional, block):
            - alternate_target_group_arn (required)
            - production_listener_rule (required)
            - role_arn (required)
            - test_listener_rule (optional)
        - container_name (required)
        - container_port (required)
        - elb_name (optional)
        - target_group_arn (optional)
    - network_configuration (block):
        - assign_public_ip (optional)
        - security_groups (optional)
        - subnets (required)
    - ordered_placement_strategy (block):
        - field (optional)
        - type (required)
    - placement_constraints (block):
        - expression (optional)
        - type (required)
    - service_connect_configuration (block):
        - access_log_configuration (optional, block):
            - format (required)
            - include_query_parameters (optional)
        - enabled (required)
        - log_configuration (optional, block):
            - log_driver (required)
            - options (optional)
            - secret_option (optional, block):
                - name (required)
                - value_from (required)
        - namespace (optional)
        - service (optional, block):
            - client_alias (optional, block):
                - dns_name (optional)
                - port (required)
                - test_traffic_rules (optional, block):
                    - header (optional, block):
                        - name (required)
                        - value (required, block):
                            - exact (required)
            - discovery_name (optional)
            - ingress_port_override (optional)
            - port_name (required)
            - timeout (optional, block):
                - idle_timeout_seconds (optional)
                - per_request_timeout_seconds (optional)
            - tls (optional, block):
                - issuer_cert_authority (required, block):
                    - aws_pca_authority_arn (required)
                - kms_key (optional)
                - role_arn (optional)
    - service_registries (block):
        - container_name (optional)
        - container_port (optional)
        - port (optional)
        - registry_arn (required)
    - volume_configuration (block):
        - managed_ebs_volume (required, block):
            - encrypted (optional)
            - file_system_type (optional)
            - iops (optional)
            - kms_key_id (optional)
            - role_arn (required)
            - size_in_gb (optional)
            - snapshot_id (optional)
            - tag_specifications (optional, block):
                - propagate_tags (optional)
                - resource_type (required)
                - tags (optional)
            - throughput (optional)
            - volume_initialization_rate (optional)
            - volume_type (optional)
        - name (required)
    - vpc_lattice_configurations (block):
        - port_name (required)
        - role_arn (required)
        - target_group_arn (required)
EOT

  type = map(object({
    name                               = string
    task_definition                    = optional(string)
    tags_all                           = optional(map(string))
    tags                               = optional(map(string))
    sigint_rollback                    = optional(bool)
    scheduling_strategy                = optional(string)
    region                             = optional(string)
    propagate_tags                     = optional(string)
    platform_version                   = optional(string)
    launch_type                        = optional(string)
    triggers                           = optional(map(string))
    iam_role                           = optional(string)
    force_new_deployment               = optional(bool)
    force_delete                       = optional(bool)
    enable_execute_command             = optional(bool)
    enable_ecs_managed_tags            = optional(bool)
    desired_count                      = optional(number)
    deployment_minimum_healthy_percent = optional(number)
    deployment_maximum_percent         = optional(number)
    cluster                            = optional(string)
    availability_zone_rebalancing      = optional(string)
    health_check_grace_period_seconds  = optional(number)
    wait_for_steady_state              = optional(bool)
    alarms = optional(object({
      alarm_names = set(string)
      enable      = bool
      rollback    = bool
    }))
    capacity_provider_strategy = optional(list(object({
      base              = optional(number)
      capacity_provider = string
      weight            = optional(number)
    })))
    deployment_circuit_breaker = optional(object({
      enable   = bool
      rollback = bool
    }))
    deployment_configuration = optional(object({
      bake_time_in_minutes = optional(string)
      canary_configuration = optional(object({
        canary_bake_time_in_minutes = optional(string)
        canary_percent              = optional(number)
      }))
      lifecycle_hook = optional(list(object({
        hook_details     = optional(string)
        hook_target_arn  = string
        lifecycle_stages = list(string)
        role_arn         = string
      })))
      linear_configuration = optional(object({
        step_bake_time_in_minutes = optional(string)
        step_percent              = optional(number)
      }))
      strategy = optional(string)
    }))
    deployment_controller = optional(object({
      type = optional(string)
    }))
    load_balancer = optional(list(object({
      advanced_configuration = optional(object({
        alternate_target_group_arn = string
        production_listener_rule   = string
        role_arn                   = string
        test_listener_rule         = optional(string)
      }))
      container_name   = string
      container_port   = number
      elb_name         = optional(string)
      target_group_arn = optional(string)
    })))
    network_configuration = optional(object({
      assign_public_ip = optional(bool)
      security_groups  = optional(set(string))
      subnets          = set(string)
    }))
    ordered_placement_strategy = optional(list(object({
      field = optional(string)
      type  = string
    })))
    placement_constraints = optional(list(object({
      expression = optional(string)
      type       = string
    })))
    service_connect_configuration = optional(object({
      access_log_configuration = optional(object({
        format                   = string
        include_query_parameters = optional(string)
      }))
      enabled = bool
      log_configuration = optional(object({
        log_driver = string
        options    = optional(map(string))
        secret_option = optional(list(object({
          name       = string
          value_from = string
        })))
      }))
      namespace = optional(string)
      service = optional(list(object({
        client_alias = optional(object({
          dns_name = optional(string)
          port     = number
          test_traffic_rules = optional(list(object({
            header = optional(object({
              name = string
              value = object({
                exact = string
              })
            }))
          })))
        }))
        discovery_name        = optional(string)
        ingress_port_override = optional(number)
        port_name             = string
        timeout = optional(object({
          idle_timeout_seconds        = optional(number)
          per_request_timeout_seconds = optional(number)
        }))
        tls = optional(object({
          issuer_cert_authority = object({
            aws_pca_authority_arn = string
          })
          kms_key  = optional(string)
          role_arn = optional(string)
        }))
      })))
    }))
    service_registries = optional(object({
      container_name = optional(string)
      container_port = optional(number)
      port           = optional(number)
      registry_arn   = string
    }))
    volume_configuration = optional(object({
      managed_ebs_volume = object({
        encrypted        = optional(bool)
        file_system_type = optional(string)
        iops             = optional(number)
        kms_key_id       = optional(string)
        role_arn         = string
        size_in_gb       = optional(number)
        snapshot_id      = optional(string)
        tag_specifications = optional(list(object({
          propagate_tags = optional(string)
          resource_type  = string
          tags           = optional(map(string))
        })))
        throughput                 = optional(number)
        volume_initialization_rate = optional(number)
        volume_type                = optional(string)
      })
      name = string
    }))
    vpc_lattice_configurations = optional(list(object({
      port_name        = string
      role_arn         = string
      target_group_arn = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.ordered_placement_strategy == null || (length(v.ordered_placement_strategy) <= 5)
      )
    ])
    error_message = "Each ordered_placement_strategy list must contain at most 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.placement_constraints == null || (length(v.placement_constraints) <= 10)
      )
    ])
    error_message = "Each placement_constraints list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.deployment_configuration == null || (v.deployment_configuration.linear_configuration == null || (v.deployment_configuration.linear_configuration.step_percent == null || (v.deployment_configuration.linear_configuration.step_percent >= 3.0 && v.deployment_configuration.linear_configuration.step_percent <= 100.0)))
      )
    ])
    error_message = "must be between 3.0 and 100.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.deployment_configuration == null || (v.deployment_configuration.canary_configuration == null || (v.deployment_configuration.canary_configuration.canary_percent == null || (v.deployment_configuration.canary_configuration.canary_percent >= 0.1 && v.deployment_configuration.canary_configuration.canary_percent <= 100.0)))
      )
    ])
    error_message = "must be between 0.1 and 100.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.load_balancer == null || alltrue([for item in v.load_balancer : (item.container_port >= 0 && item.container_port <= 65536)])
      )
    ])
    error_message = "must be between 0 and 65536"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.service_connect_configuration == null || (v.service_connect_configuration.service == null || alltrue([for item in v.service_connect_configuration.service : (item.ingress_port_override == null || (item.ingress_port_override >= 0 && item.ingress_port_override <= 65535))]))
      )
    ])
    error_message = "must be between 0 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_services : (
        v.service_registries == null || (v.service_registries.container_port == null || (v.service_registries.container_port >= 0 && v.service_registries.container_port <= 65536))
      )
    ])
    error_message = "must be between 0 and 65536"
  }
  # Note: 44 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

