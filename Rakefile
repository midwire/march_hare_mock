require "bundler/gem_tasks"

begin
  require "midwire_common/rake_tasks"
rescue StandardError => e
  puts ">>> Could not load 'midwire_common/rake_tasks': #{e}"
  exit
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec
