# Class for handling al-agent configuration
class al_agents::configure inherits al_agents {

  if $al_agents::proxy_url == undef {
    $configure = "/etc/init.d/al-agent configure --host ${al_agents::egress_url} --port ${al_agents::egress_port}"
  }
  else {
    $configure = "/etc/init.d/al-agent configure --host ${al_agents::egress_url} --port ${al_agents::egress_port} --proxy ${al_agents::proxy_url}"
  }
  exec {'configuration':
    command => $configure,
    creates => '/var/alertlogic/lib/agent/etc/controller_host'
  }
}
