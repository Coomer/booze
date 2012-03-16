module Booze
  class Configuration

    attr_accessor :tab_color
    attr_accessor :text_color
    attr_accessor :debug_environments

    def initialize
      @tab_color ||= "#ff0099"
      @text_color ||= "#ffffff"
      @debug_environments ||= ["development"]
    end

    # Setter to ensure debug_environments is Array
    def debug_environments=(environments)
      raise ArgumentError, "booze configuration error: debug_environments must be an Array" unless environments.is_a?(Array)
      @debug_environments = environments
    end

  end
end
