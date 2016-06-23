module Puppet::Parser::Functions
  newfunction(:windows_options, :type => :rvalue) do |args|

    raise(Puppet::ParseError, "windows_options(): Wrong number of arguments " +
      "given (#{args.size} for 1)") if args.size < 5

    registration_key = args[0]
    egress_url       = args[1]
    egress_port      = args[2]
    proxy_url        = args[3] || nil
    for_imaging      = args[4]
    win_options = []
    win_options << "prov_key=#{registration_key}"
    win_options << 'prov_only=host' unless for_imaging == false
    win_options << "USE_PROXY=#{proxy_url}" unless proxy_url == ''
    win_options << 'install_only=1' if for_imaging
    win_options << "sensor_host=#{egress_url}"
    win_options << "sensor_port=#{egress_port}"

    return win_options
  end
end

# vim: set ts=2 sw=2 et :