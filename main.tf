resource "aws_ecs_service" "ecs_services" {
  for_each = var.ecs_services

  name                               = each.value.name
  task_definition                    = each.value.task_definition
  tags_all                           = each.value.tags_all
  tags                               = each.value.tags
  sigint_rollback                    = each.value.sigint_rollback
  scheduling_strategy                = each.value.scheduling_strategy
  region                             = each.value.region
  propagate_tags                     = each.value.propagate_tags
  platform_version                   = each.value.platform_version
  launch_type                        = each.value.launch_type
  triggers                           = each.value.triggers
  iam_role                           = each.value.iam_role
  force_new_deployment               = each.value.force_new_deployment
  force_delete                       = each.value.force_delete
  enable_execute_command             = each.value.enable_execute_command
  enable_ecs_managed_tags            = each.value.enable_ecs_managed_tags
  desired_count                      = each.value.desired_count
  deployment_minimum_healthy_percent = each.value.deployment_minimum_healthy_percent
  deployment_maximum_percent         = each.value.deployment_maximum_percent
  cluster                            = each.value.cluster
  availability_zone_rebalancing      = each.value.availability_zone_rebalancing
  health_check_grace_period_seconds  = each.value.health_check_grace_period_seconds
  wait_for_steady_state              = each.value.wait_for_steady_state

  dynamic "alarms" {
    for_each = each.value.alarms != null ? [each.value.alarms] : []
    content {
      alarm_names = alarms.value.alarm_names
      enable      = alarms.value.enable
      rollback    = alarms.value.rollback
    }
  }

  dynamic "capacity_provider_strategy" {
    for_each = each.value.capacity_provider_strategy != null ? each.value.capacity_provider_strategy : []
    content {
      base              = capacity_provider_strategy.value.base
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
    }
  }

  dynamic "deployment_circuit_breaker" {
    for_each = each.value.deployment_circuit_breaker != null ? [each.value.deployment_circuit_breaker] : []
    content {
      enable   = deployment_circuit_breaker.value.enable
      rollback = deployment_circuit_breaker.value.rollback
    }
  }

  dynamic "deployment_configuration" {
    for_each = each.value.deployment_configuration != null ? [each.value.deployment_configuration] : []
    content {
      bake_time_in_minutes = deployment_configuration.value.bake_time_in_minutes
      dynamic "canary_configuration" {
        for_each = deployment_configuration.value.canary_configuration != null ? [deployment_configuration.value.canary_configuration] : []
        content {
          canary_bake_time_in_minutes = canary_configuration.value.canary_bake_time_in_minutes
          canary_percent              = canary_configuration.value.canary_percent
        }
      }
      dynamic "lifecycle_hook" {
        for_each = deployment_configuration.value.lifecycle_hook != null ? deployment_configuration.value.lifecycle_hook : []
        content {
          hook_details     = lifecycle_hook.value.hook_details
          hook_target_arn  = lifecycle_hook.value.hook_target_arn
          lifecycle_stages = lifecycle_hook.value.lifecycle_stages
          role_arn         = lifecycle_hook.value.role_arn
        }
      }
      dynamic "linear_configuration" {
        for_each = deployment_configuration.value.linear_configuration != null ? [deployment_configuration.value.linear_configuration] : []
        content {
          step_bake_time_in_minutes = linear_configuration.value.step_bake_time_in_minutes
          step_percent              = linear_configuration.value.step_percent
        }
      }
      strategy = deployment_configuration.value.strategy
    }
  }

  dynamic "deployment_controller" {
    for_each = each.value.deployment_controller != null ? [each.value.deployment_controller] : []
    content {
      type = deployment_controller.value.type
    }
  }

  dynamic "load_balancer" {
    for_each = each.value.load_balancer != null ? each.value.load_balancer : []
    content {
      dynamic "advanced_configuration" {
        for_each = load_balancer.value.advanced_configuration != null ? [load_balancer.value.advanced_configuration] : []
        content {
          alternate_target_group_arn = advanced_configuration.value.alternate_target_group_arn
          production_listener_rule   = advanced_configuration.value.production_listener_rule
          role_arn                   = advanced_configuration.value.role_arn
          test_listener_rule         = advanced_configuration.value.test_listener_rule
        }
      }
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
      elb_name         = load_balancer.value.elb_name
      target_group_arn = load_balancer.value.target_group_arn
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? [each.value.network_configuration] : []
    content {
      assign_public_ip = network_configuration.value.assign_public_ip
      security_groups  = network_configuration.value.security_groups
      subnets          = network_configuration.value.subnets
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = each.value.ordered_placement_strategy != null ? each.value.ordered_placement_strategy : []
    content {
      field = ordered_placement_strategy.value.field
      type  = ordered_placement_strategy.value.type
    }
  }

  dynamic "placement_constraints" {
    for_each = each.value.placement_constraints != null ? each.value.placement_constraints : []
    content {
      expression = placement_constraints.value.expression
      type       = placement_constraints.value.type
    }
  }

  dynamic "service_connect_configuration" {
    for_each = each.value.service_connect_configuration != null ? [each.value.service_connect_configuration] : []
    content {
      dynamic "access_log_configuration" {
        for_each = service_connect_configuration.value.access_log_configuration != null ? [service_connect_configuration.value.access_log_configuration] : []
        content {
          format                   = access_log_configuration.value.format
          include_query_parameters = access_log_configuration.value.include_query_parameters
        }
      }
      enabled = service_connect_configuration.value.enabled
      dynamic "log_configuration" {
        for_each = service_connect_configuration.value.log_configuration != null ? [service_connect_configuration.value.log_configuration] : []
        content {
          log_driver = log_configuration.value.log_driver
          options    = log_configuration.value.options
          dynamic "secret_option" {
            for_each = log_configuration.value.secret_option != null ? log_configuration.value.secret_option : []
            content {
              name       = secret_option.value.name
              value_from = secret_option.value.value_from
            }
          }
        }
      }
      namespace = service_connect_configuration.value.namespace
      dynamic "service" {
        for_each = service_connect_configuration.value.service != null ? service_connect_configuration.value.service : []
        content {
          dynamic "client_alias" {
            for_each = service.value.client_alias != null ? [service.value.client_alias] : []
            content {
              dns_name = client_alias.value.dns_name
              port     = client_alias.value.port
              dynamic "test_traffic_rules" {
                for_each = client_alias.value.test_traffic_rules != null ? client_alias.value.test_traffic_rules : []
                content {
                  dynamic "header" {
                    for_each = test_traffic_rules.value.header != null ? [test_traffic_rules.value.header] : []
                    content {
                      name = header.value.name
                      value {
                        exact = header.value.value.exact
                      }
                    }
                  }
                }
              }
            }
          }
          discovery_name        = service.value.discovery_name
          ingress_port_override = service.value.ingress_port_override
          port_name             = service.value.port_name
          dynamic "timeout" {
            for_each = service.value.timeout != null ? [service.value.timeout] : []
            content {
              idle_timeout_seconds        = timeout.value.idle_timeout_seconds
              per_request_timeout_seconds = timeout.value.per_request_timeout_seconds
            }
          }
          dynamic "tls" {
            for_each = service.value.tls != null ? [service.value.tls] : []
            content {
              issuer_cert_authority {
                aws_pca_authority_arn = tls.value.issuer_cert_authority.aws_pca_authority_arn
              }
              kms_key  = tls.value.kms_key
              role_arn = tls.value.role_arn
            }
          }
        }
      }
    }
  }

  dynamic "service_registries" {
    for_each = each.value.service_registries != null ? [each.value.service_registries] : []
    content {
      container_name = service_registries.value.container_name
      container_port = service_registries.value.container_port
      port           = service_registries.value.port
      registry_arn   = service_registries.value.registry_arn
    }
  }

  dynamic "volume_configuration" {
    for_each = each.value.volume_configuration != null ? [each.value.volume_configuration] : []
    content {
      managed_ebs_volume {
        encrypted        = volume_configuration.value.managed_ebs_volume.encrypted
        file_system_type = volume_configuration.value.managed_ebs_volume.file_system_type
        iops             = volume_configuration.value.managed_ebs_volume.iops
        kms_key_id       = volume_configuration.value.managed_ebs_volume.kms_key_id
        role_arn         = volume_configuration.value.managed_ebs_volume.role_arn
        size_in_gb       = volume_configuration.value.managed_ebs_volume.size_in_gb
        snapshot_id      = volume_configuration.value.managed_ebs_volume.snapshot_id
        dynamic "tag_specifications" {
          for_each = volume_configuration.value.managed_ebs_volume.tag_specifications != null ? volume_configuration.value.managed_ebs_volume.tag_specifications : []
          content {
            propagate_tags = tag_specifications.value.propagate_tags
            resource_type  = tag_specifications.value.resource_type
            tags           = tag_specifications.value.tags
          }
        }
        throughput                 = volume_configuration.value.managed_ebs_volume.throughput
        volume_initialization_rate = volume_configuration.value.managed_ebs_volume.volume_initialization_rate
        volume_type                = volume_configuration.value.managed_ebs_volume.volume_type
      }
      name = volume_configuration.value.name
    }
  }

  dynamic "vpc_lattice_configurations" {
    for_each = each.value.vpc_lattice_configurations != null ? each.value.vpc_lattice_configurations : []
    content {
      port_name        = vpc_lattice_configurations.value.port_name
      role_arn         = vpc_lattice_configurations.value.role_arn
      target_group_arn = vpc_lattice_configurations.value.target_group_arn
    }
  }
}

