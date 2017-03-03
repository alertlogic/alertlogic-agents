class al_agents::linux inherits al_agents {

  if $syslog_type == 'none' {
    info("no syslog detected skipping syslog configuration for AL Agent")
  }

  if $syslog_type == 'syslog-ng' {
    class { '::al_agents::syslogng': }
  }

  if $syslog_type == 'rsyslog' {
    class { '::al_agents::rsyslog': }
  }

  if $al_agents::for_imaging == 'false' {
    anchor { 'al_agents::linux::begin': } ->
    class { '::al_agents::install': } ->
    class { '::al_agents::configure': } ->
    class { '::al_agents::provision': } ->
    class { '::al_agents::start': } ->
    anchor { 'al_agents""linux::end': }
  }
  else {
    anchor { 'al_agents::linux::begin': } ->
    class { '::al_agents::install': } ->
    class { '::al_agents::configure': } ->
    anchor { 'al_agents""linux::end': }
  }
}
