require 'fileutils'
require 'yaml'

module Puppi
  autoload :Files, 'puppi/files'
  autoload :Action, 'puppi/action'
  autoload :GenerateSampleData, 'puppi/generate_sample_data'
  autoload :Loader, 'puppi/loader'
  autoload :Notification, 'puppi/notification'
  autoload :Notifications, 'puppi/notifications'
  autoload :Version, 'puppi/version'

  if ENV["RUN_ENV"] == "TEST"
    @@puppidir = File.dirname(File.dirname(__FILE__))+"/tmp/config"
    @@stdout_print = false
  else
    @@puppidir = "/etc/puppi"
    @@stdout_print = true
  end

  class << self
    def puppidir
      @@puppidir
    end

    def stdout_print
      @@stdout_print
    end

    def initial_checks
      directories = %w[ data helpers notifications ]
      directories.each do |directory|
        FileUtils.mkdir_p @@puppidir+'/'+directory
        raise "Puppi::NoPuppiDir" unless File.directory?(puppidir+'/'+directory)
      end
    end
  end
end
