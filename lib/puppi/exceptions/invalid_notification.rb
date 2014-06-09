module Puppi
  module Exceptions
    class InvalidNotification < StandardError
      def self.initialize
        super("The provided notification is invalid!")
      end
    end
  end
end