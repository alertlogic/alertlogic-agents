class al_agents::rsyslog inherits al_agents {

  include 'rsyslog'

  service { 'rsyslog':
    ensure  => 'running',
    enable  => true,
    require => Package['rsyslog'],
  }

  file { '/etc/rsyslog.d/alertlogic.conf':
    content => template('rsyslog/alertlogic.conf.erb'),
    notify  => Service['rsyslog'],
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}