class al_agents::start inherits al_agents {

  service { $al_agents::al_agent_service:
    ensure => $al_agents::service_ensure,
  }
}