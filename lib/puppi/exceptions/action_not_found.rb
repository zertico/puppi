module Puppi
  module Exceptions
    class ActionNotFound < StandardError
      def self.initialize
        super("The provided action could not be found!")
      end
    end
  end
end