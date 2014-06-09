module Puppi
  module Exceptions
    class WrongCommand < StandardError
      def self.initialize
        super("The provided command is wrong!")
      end
    end
  end
end