module Puppi
  module Exceptions
    class InvalidDatafile < StandardError
      def self.initialize
        super("The provided datafile is invalid!")
      end
    end
  end
end