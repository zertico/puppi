module Puppi
  require 'fileutils'
  require 'puppi/files/datafile'
  require 'puppi/files/helper'
  require 'puppi/files/notification'
  require 'puppi/action'
  require 'puppi/generate_sample_data'
  require 'puppi/loader'
  require 'puppi/notification'
  require 'puppi/notifications/mail'
  require 'puppi/notifications/stdout'
  require 'puppi/version'
  require 'yaml'
  
  if ENV["RUN_ENV"] == "TEST"
    @@puppidir = File.dirname(File.dirname(__FILE__))+"/tmp/config"
  else
    @@puppidir = "/etc/puppi"
  end
  
  class << self
    def puppidir
      @@puppidir
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