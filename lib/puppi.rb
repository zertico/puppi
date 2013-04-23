require 'yaml'

module Puppi
  autoload :Files, 'puppi/files'
  autoload :Action, 'puppi/action'
  autoload :GenerateSampleData, 'puppi/generate_sample_data'
  autoload :Loader, 'puppi/loader'
  autoload :Notification, 'puppi/notification'
  autoload :Notifications, 'puppi/notifications'
  autoload :Exceptions, 'puppi/exceptions'
  autoload :Version, 'puppi/version'

  def self.puppidir
    "/etc/puppi"
  end

  def self.stdout_print
    true
  end

  def self.initial_checks
    directories = %w[ data helpers notifications ]
    directories.each do |directory|
      FileUtils.mkdir_p "#{puppidir}/#{directory}"
      raise Exceptions::NoPuppiDir unless File.directory?("#{puppidir}/#{directory}")
    end
  end
end