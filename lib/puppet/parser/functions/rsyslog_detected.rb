module Puppet::Parser::Functions
  newfunction(:rsyslog_detected, :type => :rvalue) do |args|
    return File.exist?('/etc/rsyslog.conf')
  end
end

# vim: set ts=2 sw=2 et :