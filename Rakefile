require 'rake'
require 'rake/testtask'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "static_resource"
    s.summary = "A gem that leverages the XML parsing of ActiveResource into objects without making any network calls"
    s.description = "Leverages the XML parsing of ActiveResource into objects without making any network calls by reading XML documents on your local filesystem"
    s.email = "techwhizbang@gmail.com"
    s.homepage = "http://github.com/techwhizbang/static_resource"
    s.rubyforge_project = 'static_resource'
    s.authors = ["Nick Zalabak"]
    s.add_development_dependency "mocha", ">= 0.9.8"
    s.files =  FileList["[A-Za-z]*", "{lib,test}/**/*"]
    s.test_files = FileList["test/**/*"]
    s.add_dependency "activeresource", ">= 2.3.2"
  end
 
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
 
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end
 
task :default => :test
