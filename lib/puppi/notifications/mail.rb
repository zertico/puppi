require 'mail'

module Puppi
  module Notifications
    class Mail
      def initialize
        @loader = Puppi::Loader.new
      end
      
      def output(output)
        @@output = output
        mails = load_all
        mails.each do |mail|
          mailer = @loader.load_notification(mail)
          send_mail (mailer) if valid_mailer?(mailer)
        end
      end
      
      private

      def send_mail (mail)
        mail = ::Mail.new do
                  from    mail.variables[:from]
                  to      mail.variables[:to]
                  subject mail.variables[:subject]
                  body    @@output
        end
        mail.deliver!
      end
      
      def valid_mailer? (mailer)
        return false unless mailer.class == Puppi::Files::Notification
        required_fields = %w[ from to subject ]
        required_fields.each do |required_field|
          return false unless mailer.variables.has_key? required_field.to_sym
        end
        true
      end
      
      def load_all
        @loader.load_all('notifications', nil, 'mail')
      end
    end
  end
end