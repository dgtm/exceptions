$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exceptions/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exceptions"
  s.version     = Exceptions::VERSION
  s.authors     = ["dgtm"]
  s.email       = ["dipeshgtm@gmail.com"]
  s.homepage    = "github.com/dgtm"
  s.summary     = "Handles Exceptions"
  s.description = "Catch exceptions and list them via a web interface"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "redcarpet", "2.0.0b5"
  s.add_dependency "coderay"
  s.add_dependency "oauth2"
  s.add_dependency "github_api"

  s.add_dependency "nokogiri"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency "pry"
  s.add_development_dependency "capybara", "~> 1.1"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "launchy"

  # s.add_development_dependency "pry-rails"
  # s.add_development_dependency "pry-nav"
  # s.add_development_dependency "mongoid", "~> 2.4"
  # s.add_development_dependency "bson_ext", "~> 1.5"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
