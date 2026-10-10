output "ecs_services_id" {
  description = "Map of id values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ecs_services_alarms" {
  description = "Map of alarms values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.alarms) if v.alarms != null && length(v.alarms) > 0 }
}
output "ecs_services_arn" {
  description = "Map of arn values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "ecs_services_availability_zone_rebalancing" {
  description = "Map of availability_zone_rebalancing values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.availability_zone_rebalancing if v.availability_zone_rebalancing != null && length(v.availability_zone_rebalancing) > 0 }
}
output "ecs_services_capacity_provider_strategy" {
  description = "Map of capacity_provider_strategy values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.capacity_provider_strategy if v.capacity_provider_strategy != null && length(v.capacity_provider_strategy) > 0 }
}
output "ecs_services_cluster" {
  description = "Map of cluster values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.cluster if v.cluster != null && length(v.cluster) > 0 }
}
output "ecs_services_deployment_circuit_breaker" {
  description = "Map of deployment_circuit_breaker values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.deployment_circuit_breaker) if v.deployment_circuit_breaker != null && length(v.deployment_circuit_breaker) > 0 }
}
output "ecs_services_deployment_configuration" {
  description = "Map of deployment_configuration values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.deployment_configuration) if v.deployment_configuration != null && length(v.deployment_configuration) > 0 }
}
output "ecs_services_deployment_controller" {
  description = "Map of deployment_controller values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.deployment_controller) if v.deployment_controller != null && length(v.deployment_controller) > 0 }
}
output "ecs_services_deployment_maximum_percent" {
  description = "Map of deployment_maximum_percent values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.deployment_maximum_percent if v.deployment_maximum_percent != null }
}
output "ecs_services_deployment_minimum_healthy_percent" {
  description = "Map of deployment_minimum_healthy_percent values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.deployment_minimum_healthy_percent if v.deployment_minimum_healthy_percent != null }
}
output "ecs_services_desired_count" {
  description = "Map of desired_count values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.desired_count if v.desired_count != null }
}
output "ecs_services_enable_ecs_managed_tags" {
  description = "Map of enable_ecs_managed_tags values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.enable_ecs_managed_tags if v.enable_ecs_managed_tags != null }
}
output "ecs_services_enable_execute_command" {
  description = "Map of enable_execute_command values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.enable_execute_command if v.enable_execute_command != null }
}
output "ecs_services_force_delete" {
  description = "Map of force_delete values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.force_delete if v.force_delete != null }
}
output "ecs_services_force_new_deployment" {
  description = "Map of force_new_deployment values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.force_new_deployment if v.force_new_deployment != null }
}
output "ecs_services_health_check_grace_period_seconds" {
  description = "Map of health_check_grace_period_seconds values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.health_check_grace_period_seconds if v.health_check_grace_period_seconds != null }
}
output "ecs_services_iam_role" {
  description = "Map of iam_role values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.iam_role if v.iam_role != null && length(v.iam_role) > 0 }
}
output "ecs_services_launch_type" {
  description = "Map of launch_type values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.launch_type if v.launch_type != null && length(v.launch_type) > 0 }
}
output "ecs_services_load_balancer" {
  description = "Map of load_balancer values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.load_balancer if v.load_balancer != null && length(v.load_balancer) > 0 }
}
output "ecs_services_name" {
  description = "Map of name values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "ecs_services_network_configuration" {
  description = "Map of network_configuration values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.network_configuration) if v.network_configuration != null && length(v.network_configuration) > 0 }
}
output "ecs_services_ordered_placement_strategy" {
  description = "Map of ordered_placement_strategy values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.ordered_placement_strategy if v.ordered_placement_strategy != null && length(v.ordered_placement_strategy) > 0 }
}
output "ecs_services_placement_constraints" {
  description = "Map of placement_constraints values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.placement_constraints if v.placement_constraints != null && length(v.placement_constraints) > 0 }
}
output "ecs_services_platform_version" {
  description = "Map of platform_version values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.platform_version if v.platform_version != null && length(v.platform_version) > 0 }
}
output "ecs_services_propagate_tags" {
  description = "Map of propagate_tags values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.propagate_tags if v.propagate_tags != null && length(v.propagate_tags) > 0 }
}
output "ecs_services_region" {
  description = "Map of region values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.region if v.region != null && length(v.region) > 0 }
}
output "ecs_services_scheduling_strategy" {
  description = "Map of scheduling_strategy values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.scheduling_strategy if v.scheduling_strategy != null && length(v.scheduling_strategy) > 0 }
}
output "ecs_services_service_connect_configuration" {
  description = "Map of service_connect_configuration values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.service_connect_configuration) if v.service_connect_configuration != null && length(v.service_connect_configuration) > 0 }
}
output "ecs_services_service_registries" {
  description = "Map of service_registries values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.service_registries) if v.service_registries != null && length(v.service_registries) > 0 }
}
output "ecs_services_sigint_rollback" {
  description = "Map of sigint_rollback values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.sigint_rollback if v.sigint_rollback != null }
}
output "ecs_services_tags" {
  description = "Map of tags values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "ecs_services_tags_all" {
  description = "Map of tags_all values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "ecs_services_task_definition" {
  description = "Map of task_definition values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.task_definition if v.task_definition != null && length(v.task_definition) > 0 }
}
output "ecs_services_triggers" {
  description = "Map of triggers values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.triggers if v.triggers != null && length(v.triggers) > 0 }
}
output "ecs_services_volume_configuration" {
  description = "Map of volume_configuration values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => one(v.volume_configuration) if v.volume_configuration != null && length(v.volume_configuration) > 0 }
}
output "ecs_services_vpc_lattice_configurations" {
  description = "Map of vpc_lattice_configurations values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.vpc_lattice_configurations if v.vpc_lattice_configurations != null && length(v.vpc_lattice_configurations) > 0 }
}
output "ecs_services_wait_for_steady_state" {
  description = "Map of wait_for_steady_state values across all ecs_services, keyed the same as var.ecs_services"
  value       = { for k, v in aws_ecs_service.ecs_services : k => v.wait_for_steady_state if v.wait_for_steady_state != null }
}

