class al_agents::selinux inherits al_agents {
  include selinux

  selinux::port { '1514':
    context  => 'syslogd_port_t',
    port     => 1514,
    protocol => 'tcp',
  }
}