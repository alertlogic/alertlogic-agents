# Class: al_agents
# ===========================
#
# Puppet module for installing and configuring 
#  Alert Logic, Inc. al-agent package
#
# Authors
# -------
#
# Author Name <jearly@alertlogic.com>
#
class al_agents (
  $registration_key      = $al_agents::params::registration_key,
  $egress_url            = $al_agents::params::egress_url,
  $egress_port           = $al_agents::params::egress_port,
  $proxy_url             = $al_agents::params::proxy_url,
  $for_imaging           = $al_agents::params::for_imaging,
  $al_agent_package      = $al_agents::params::al_agent_package,
  $al_agent_service      = $al_agents::params::al_agent_service,
  $arch                  = $al_agents::params::architecture,
  $svc_ensure            = $al_agents::params::service_ensure,
  $syslogng_detected     = $al_agents::params::syslogng_detected,
  $rsyslog_detected      = $al_agents::params::rsyslog_detected,
  $windows_install_guard = $al_agents::params::windows_install_guard,
) inherits al_agents::params {
  case $::operatingsystem {
    'centos', 'redhat', 'fedora': {
      if str2bool($::selinux) {
        class { '::al_agents::selinux': }
      }
      class { '::al_agents::linux': }
    }
    'debian', 'ubuntu': {
      class { '::al_agents::linux': }
    }
    'windows': {
      class { '::al_agents::windows': }
    }
    default: {
      fail("Module al_agents is not supported on ${::operatingsystem}")
    }
  }
}
