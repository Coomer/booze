$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "booze/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "booze"
  s.version     = Booze::VERSION
  s.authors     = ["Christian Coomer"]
  s.email       = ["ccoomer@christiancoomer.com"]
  s.homepage    = "http://cisforcoomer.com/"
  s.summary     = "Debug your Rails 3 app"
  s.description = "Adds a debug bar to your Rails 3 app"

  s.files = Dir["{app,config,db,lib,views}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
end
