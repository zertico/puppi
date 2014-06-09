module Puppi
  module Exceptions
    class InvalidHelper < StandardError
      def self.initialize
        super("The provided helper is invalid!")
      end
    end
  end
end