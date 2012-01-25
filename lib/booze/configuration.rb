module Booze
  class Configuration

    attr_accessor :tab_color
    attr_accessor :text_color

    def initialize
      @tab_color ||= "#ff0099"
      @text_color ||= "#ffffff"
    end

  end
end
