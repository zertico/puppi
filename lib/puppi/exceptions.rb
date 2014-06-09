module Puppi
  module Exceptions
    autoload :NoPuppiDir, 'puppi/exceptions/no_puppi_dir'
    autoload :ActionNotFound, 'puppi/exceptions/action_not_found'
    autoload :WrongCommand, 'puppi/exceptions/wrong_command'
    autoload :InvalidHelper, 'puppi/exceptions/invalid_helper'
    autoload :InvalidDatafile, 'puppi/exceptions/invalid_datafile'
    autoload :InvalidNotification, 'puppi/exceptions/invalid_notification'
  end
end