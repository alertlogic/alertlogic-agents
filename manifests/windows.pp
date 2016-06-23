# == Class: al_agents::windows
class al_agents::windows inherits al_agents {

  file { 'SOFTWARE_DIR':
    ensure => directory,
    path   => "C:\\SOFTWARE",
  }

  $agent_source = $al_agents::al_agent_package
  $agent_path = "C:\\SOFTWARE\al-agent.msi"
  $agent_package_name = 'al-agent.msi'
  $win_options = windows_options(
    $al_agents::registration_key,
    $al_agents::egress_url,
    $al_agents::egress_port,
    $al_agents::proxy_url,
    $al_agents::for_imaging
  )

  notify{$win_options: }
  file { $agent_path:
    ensure => present,
    source => $agent_source,
    notify => Package[$agent_package_name],
  }
  if windows_install_guard($al_agents::windows_install_guard) {
    notice("${al_agents::windows_install_guard} Guard file exists. skipping installation...")
  }
  else {
    package { $agent_package_name:
      ensure          => installed,
      source          => $agent_path,
      require         => File[$agent_path],
      install_options => $win_options,
    }
  }

  unless $al_agents::for_imaging {
    class { '::al_agents::start': }
  }
}