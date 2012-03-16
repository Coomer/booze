require 'erb'

module Booze
  module ControllerMixins

    # After filter
    def display_debug_bar
      config = Booze.config
      queries = Booze::QueryStore.all
      template_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views/debug_bar.html.erb'))
      template = File.open(template_path, "rb") { |f| f.read }
      html = ERB.new(template).result(binding)
      response.body = response.body.gsub("</body>", "#{html}</body>")
    end

  end
end
