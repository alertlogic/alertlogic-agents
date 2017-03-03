class al_agents::syslogng inherits al_agents {

  if versioncmp( $syslog_ng_ver, '3.2') <= 0 {
    file_line { 'append_alertlogic_conf_to_syslog_ng':
      path => '/etc/syslog-ng/syslog-ng.conf',
      line => "include '/etc/syslog-ng/conf.d/alertlogic.conf';",
    }
  }

  $source_log = $al_agents::source_log

  if ! defined(Package['syslog-ng']) {
    service { 'syslog-ng':
      ensure  => 'running',
      enable  => true,
    }
  }

  file { '/etc/syslog-ng/conf.d/alertlogic.conf':
    content => template('al_agents/syslog_ng/alertlogic.conf.erb'),
    notify  => Service['syslog-ng'],
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}
