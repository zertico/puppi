module Puppi
  class Notification

    attr_reader :notify_methods

    def initialize(notifications, output)
      @notify_methods = Array.new

      if notifications.empty?
        notifier = Puppi::Notifications::Stdout.new
        notifier.output(output)
        @notify_methods << 'stdout'
        return
      end
      @loader = Puppi::Loader.new
      validate_notifications_methods notifications
      notifications.each do |notification|
        notifier = Puppi::Notifications.class_eval(notification.capitalize).new
        if notifier.respond_to? 'output'
          notifier.output(output)
          @notify_methods << notification
        end
      end
    end

    def validate_notifications_methods (notifications)
      notifications.each do |notification|
        unless valid_method? notification
          raise Exceptions::InvalidNotification
        end
      end
    end

    private
    def valid_method? (method)
      @valid_methods = Array.new
      Puppi::Notifications.constants.each do |valid_method|
        @valid_methods << valid_method.to_s
      end
      @valid_methods.include? method.capitalize
    end
  end
end