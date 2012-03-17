# booze

A gem that provides a debug bar for Rails 3 applications.

## Installation

In your Gemfile, add the following to get booze to start working. Out of the box, the gem shows debug information when you're running a Rails app in development mode.

    gem "booze", :git => "git://github.com/Coomer/booze.git"

## Configuration

Configuration is optional. A good spot for this configuration code is in an initializer.

Example config/initializers/booze.rb:

    Booze.configure do |config|
      # Background color for the query count tab
      config.tab_color = "#ff0099"
      # Text color for the query count tab
      config.text_color = "#ffffff"
      # Array of Rails environments to enable debug bar for, default is ["development"]
      config.debug_environments = ["development", "test"]
      # Filter out PRAGMA queries, default is false
      config.filter_pragma_queries = true
    end
