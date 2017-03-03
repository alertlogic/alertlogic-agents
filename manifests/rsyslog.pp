class al_agents::rsyslog inherits al_agents {
  if ! defined(Package['rsyslog']) {
    service { 'rsyslog':
      ensure  => 'running',
      enable  => true,
    }
  }

  file { '/etc/rsyslog.d/alertlogic.conf':
    content => template('al_agents/rsyslog/alertlogic.conf.erb'),
    notify  => Service['rsyslog'],
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}
