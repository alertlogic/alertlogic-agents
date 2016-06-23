module Puppet::Parser::Functions
  newfunction(:windows_install_guard, :type => :rvalue) do |args|

    raise(Puppet::ParseError, "windows_install_guard(): Wrong number of arguments " +
      "given (#{args.size} for 1)") if args.size < 1

    guard_file = args[0]
    return File.exist?(guard_file)

  end
end

# vim: set ts=2 sw=2 et :