module Booze
  class Railtie < Rails::Railtie
    config.before_initialize do
      if Rails.env.development?
        # Once Rails starts processing the controller (or is done processing),
        # ensure the query store is empty
        ActiveSupport::Notifications.subscribe /(start_processing|process_action)\.action_controller/ do |name, start, finish, id, payload|
          Booze::QueryStore.clear
        end

        # Subscribe to sql statements and add them to the query store as they come in
        ActiveSupport::Notifications.subscribe /sql/ do |name, start, finish, id, payload|
          Booze::QueryStore.add(payload[:sql])
        end

        require "booze/controller_mixins"
        ActionController::Base.send(:include, Booze::ControllerMixins)

        # Create an after filter to display the debug bar
        ActionController::Base.send(:after_filter, :display_debug_bar)
      end
    end
  end
end
