module Puppet::Parser::Functions
  newfunction(:syslogng_detected, :type => :rvalue) do |args|
    return File.exist?('/etc/syslog-ng/syslog-ng.conf')
  end
end

# vim: set ts=2 sw=2 et :