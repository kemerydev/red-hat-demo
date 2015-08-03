require 'rake'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:test) do |t|
  t.cucumber_opts = "features --format pretty"
end

Cucumber::Rake::Task.new(:menu_links) do |t|
  t.cucumber_opts = "features/menu_links.feature --format pretty"
end

Cucumber::Rake::Task.new(:search) do |t|
  t.cucumber_opts = "features/search.feature --format pretty"
end

task :default => 'test'
#task :default => 'menu_links'
#task :default => 'search'