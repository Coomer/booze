require "booze/configuration"
require "booze/controller_mixins"
require "booze/query_store"
require "booze/railtie"

module Booze

  def self.configure
    yield(config)
  end

  def self.config
    @configuration ||= Configuration.new
    @configuration
  end

end
