# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{static_resource}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Zalabak"]
  s.date = %q{2010-03-06}
  s.description = %q{Leverages the XML parsing of ActiveResource into objects without making any network calls by reading XML documents on your local filesystem}
  s.email = %q{techwhizbang@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "MIT-LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/static_resource.rb",
     "static_resource.gemspec",
     "test/all_tests.rb",
     "test/country.xml",
     "test/os.xml",
     "test/states.xml",
     "test/static_resource_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/techwhizbang/static_resource}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{static_resource}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A gem that leverages the XML parsing of ActiveResource into objects without making any network calls}
  s.test_files = [
    "test/all_tests.rb",
     "test/country.xml",
     "test/os.xml",
     "test/states.xml",
     "test/static_resource_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<activeresource>, [">= 2.3.2"])
    else
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
      s.add_dependency(%q<activeresource>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
    s.add_dependency(%q<activeresource>, [">= 2.3.2"])
  end
end

