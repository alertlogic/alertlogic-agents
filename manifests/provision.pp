class al_agents::provision inherits al_agents {

  exec {'provision':
    command => "/etc/init.d/al-agent provision --key ${al_agents::registration_key} --inst-type host",
    creates => '/var/alertlogic/etc/host_crt.pem'
  }
}
