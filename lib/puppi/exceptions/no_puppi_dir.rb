module Puppi
  module Exceptions
    class NoPuppiDir < StandardError
      def self.initialize
        super("The Puppi directory could not be found!")
      end
    end
  end
end