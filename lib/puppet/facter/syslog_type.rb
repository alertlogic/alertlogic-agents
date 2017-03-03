Facter.add(:syslog_type) do
  setcode do
    if File.exist?('/etc/rsyslog.conf')
        syslog_type = "rsyslog"
    elsif File.exist?('/etc/syslog-ng/syslog-ng.conf')
        syslog_type = "syslog-ng"
    else
        syslog_type = "none"
    end
  end
end
