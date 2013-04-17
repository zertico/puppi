module Puppi
  module Notifications
    class Stdout
      def initialize
      end
      
      def output(output)
        puts output if Puppi::stdout_print
      end
    end
  end
end