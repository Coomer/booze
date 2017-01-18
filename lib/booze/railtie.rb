# Railtie to run after Rails app has been initialized and everything in
# config/initializers/ has been loaded.
#
# What we do is subscribe to Rails events (clear store on controller start/finish,
# and save SQL when an ActiveRecord  query is executed). Then we create an
# after_filter to get the queries from the query store and display them.
module Booze
  class Railtie < Rails::Railtie
    config.after_initialize do
      debug_environments = Booze.config.debug_environments
      Rails.logger.debug "booze: Inside railtie. Booze-enabled environments: #{Booze.config.debug_environments}. This environment: #{Rails.env}"
      if debug_environments.include?(Rails.env)
        Rails.logger.debug "booze: Enabling now."
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
