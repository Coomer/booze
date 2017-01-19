# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Include booze configuration here. We do this instead of in config/initializers
# because we can also run environment_without_booze.rb instead of this file to
# load the normal Rails environment without booze, and we don't want that file
# loading booze through an initializer
#
# We could copy the whole dummy app and have one with the initializer and one
# without, but then that's a lot of duplicated code, so this is the solution.
Booze.configure do |config|
  config.debug_environments = ["test"]
end
# End of booze configuration

# Initialize the Rails application.
Rails.application.initialize!
