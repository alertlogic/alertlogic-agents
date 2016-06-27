[![Build Status](https://travis-ci.org/alertlogic/alertlogic-agents.svg?branch=master)](https://travis-ci.org/alertlogic/alertlogic-agents)


Alert Logic Agent Puppet Module
=================
This module is used to install and configure the Alert Logic agent.

Requirements
------------
The following platforms are tested directly.

- ubuntu-12.04
- ubuntu-14.04
- centos-6.4
- centos-7.0
- debian-7.8
- fedora-19
- windows-2012r2

#### Module Dependencies
- rsyslog
- selinux_policy

Parameters
----------

* `$registration_key` - your required registration key. String defaults to `your_registration_key_here`
* `$for_imaging` - The `$for_imaging` attribute determines if the agent will be configured and provisioned.  If the `$for_imaging` attribute is set to `true` then the install process performs an installation of the agent but will not start the agent once installation is completed.  This allows for instance snapshots to be saved and started for later use.  With this attribute set to `false` then the provisioning process is performed during setup and the agent is started once complete.  Boolean defaults to `false`
* `$egress_url` - By default all traffic is sent to https://vaporator.alertlogic.com.  This attribute is useful if you have a machine that is responsible for outbound traffic (NAT box).  If you specify your own URL ensure that it is a properly formatted URI.  String defaults to `https://vaporator.alertlogic.com`
* `$proxy_url` - By default al-agent does not require the use of a proxy.  This attribute is useful if you want to avoid a single point of egress.  When a proxy is used, both `$egress_url` and `$proxy_url` values are required.  If you specify a proxy URL ensure that it is a properly formatted URI.  String defaults to `undef`

Usage
-----
### al_agents
The default module will attempt to perform an install best suited for your environment.  It will install the package for your system. The default attributes will install the agent in `host` mode (not for image capture).

To use the module update the params.pp as indicated above with your registration key and preferred egress endpoint and include the module in your site.pp

`include ::al_agents`

On both windows and linux the proper package is installed and the agent is started when the module's defaults are used.

### al_agents::rsyslog
On linux, if you are using rsyslog and desire to skip an attempt at detection, you may run the al_agent::rsyslog module independently.  Logging changes are added under the installation's subdirectory in a file named `alertlogic.conf`

### al_agents::syslog_ng
On linux, if you are using syslog-ng and desire to skip an attempt at detection, you may run the al_agents::syslog_ng module independently.  Logging changes are added under the installation's subdirectory in a file named `alertlogic.conf`

### al_agents::selinux
On linux, if you are using selinux and desire to skip an attempt at detection, you may run the al_agents::selinux module independently. This module will add a selinux policy to allow for logging to port 1514.  This module does not enable nor disable selinux policy enforcement.

### al_agents::install
On linux, should you desire to install the package, configure and provision the machine you may run this module independently.

### al_agents::start
On linux, this module as stated starts the service.


Examples
--------

##### install example
```
include ::al_agents::install
```

##### à la carte module example
```
include ::al_agents
```


Configurations
--------------
The attribute `for_imaging` determine your installation type.  It is a boolean value and by default is `false`.  Setting this value to true will prepare your agent for imaging only and will not provision the agent.


Performing an agent install using the module's default attributes, will setup the agent and provision the instance immediately. see *configuration #1* above.  If you have properly set your registration key, your host should appear within Alert Logic's Console within 15 minutes.

Testing
-------

In the root of the project:
* to execute lint tests: `puppet-lint .`
* to execute rpsec-puppet tests: `rake spec`


Troubleshooting
---------------

If the module fails at the provisioning step, one cause is that the agent cannot connect to the egress_url.  Ensure that the proper permissions are configured on the security groups and ACLs to allow for outbound access.  Also check your `$egress_url` attribute and ensure that it is a properly formatted URI.


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License:
Distributed under the Apache 2.0 license.

Authors: 
Justin Early (jearly@alertlogic.com)