result = %x{syslog-ng --version | grep Installer-Version: | awk '{print $2}'}

Facter.add(:syslog_ng_ver) do
  setcode do
    if File.exist?('/etc/syslog-ng/syslog-ng.conf')
	syslog_ng_ver = result
    end
  end
end
