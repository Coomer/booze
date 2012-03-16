module Booze
  module ControllerMixins

    # After filter
    def display_debug_bar
      config = Booze.config
      queries = Booze::QueryStore.all
      html = <<EOL
<div id="debug_bar" style="position: absolute; top: 70px; right: 0; background: #{config.tab_color}; padding: 1px 4px 3px 4px; border-top-left-radius: 5px; border-bottom-left-radius: 5px; font-family: helvetica, sans-serif; font-size: 9px; line-height: 1; z-index: 999999; text-align: center;">
<a href="#" onclick="$('#debug_bar').css({'width': '90%', 'z-index': '40000'}); $('#debug_bar ol').show(); return false;" style="color: #{config.text_color}; text-decoration: none;"><span style="display: block; font-size: 18px; font-weight: bold;">#{queries.size}</span> queries</a>
EOL
      html << "<ol style=\"display: none; text-align: left;\">"
      queries.each do |q|
        html << "<li>#{q}</li>"
      end
      html << "</ol>"
      html << "</div>"
      response.body = response.body.gsub("</body>", "#{html}</body>")
    end

  end
end
