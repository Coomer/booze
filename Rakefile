begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Booze'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

load 'rails/tasks/statistics.rake'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

desc "Run specs without using booze"
task :spec_without_booze do
  sh("bundle exec rspec spec_without_booze")
end

task :default => [:spec, :spec_without_booze]

Bundler::GemHelper.install_tasks
