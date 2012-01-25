module Booze
  class Railtie < Rails::Railtie
    config.before_initialize do
      if Rails.env.development?
        require "booze/controller_mixins"
        ActionController::Base.send(:include, Booze::ControllerMixins)
        ActionController::Base.send(:before_filter, :clear_query_store)
        ActionController::Base.send(:after_filter, :display_debug_bar)
      end
    end
  end
end
