# Booze gem

A gem that provides a debug bar for Rails 3 applications.

## Installation

In your Gemfile, add the following to get booze to start working.

    gem "booze"

## Configuration

Configuration is optional. A good spot for this configuration code is in an initializer.

    Booze.configure do |config|
      config.tab_color = "#ff0099"
      config.text_color = "#ffffff"
    end
