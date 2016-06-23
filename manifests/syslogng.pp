class al_agents::syslogng inherits al_agents {

  service { 'syslog-ng':
    ensure  => 'running',
    enable  => true,
    require => Package['syslog-ng'],
  }

  file { '/etc/syslog-ng/conf.d':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755'
  }

  if syslog_ng_pre33() {
    file_line { 'append_alertlogic_conf_to_syslog_ng':
      path => '/etc/syslog-ng/syslog-ng.conf',
      line => "include '/etc/syslog-ng/conf.d/alertlogic.conf';",
    }
  }
  
  $source_log = $al_agents::source_log

  file { '/etc/syslog-ng/conf.d/alertlogic.conf':
    content => template('syslog_ng/alertlogic.conf.erb'),
    notify  => Service['syslog-ng'],
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}