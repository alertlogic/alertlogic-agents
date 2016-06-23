require 'mixlib/shellout'
module Puppet::Parser::Functions
  newfunction(:syslog_ng_pre33, :type => :rvalue) do |args|
    vers = Mixlib::ShellOut.new('syslog-ng -V')
    ver = vers.run_command
    version = ver.split(/\n/)[0]
    version_value = version.split[1].to_f
    return version_value <= 3.2 ? true : false
  end
end

# vim: set ts=2 sw=2 et :