#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

begin
  require 'rspec/core/rake_task'
    
  desc "Run specs"
  RSpec::Core::RakeTask.new do |t|
    t.verbose = false
  end

  task :rspec => :spec

  desc "Run specs by default"
  task :default => :spec
  
rescue Exception
end
