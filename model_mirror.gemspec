$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "model_mirror/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "model_mirror"
  s.version     = ModelMirror::VERSION
  s.authors     = ["Scott Pierce"]
  s.email       = ["scott.pierce@centro.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ModelMirror."
  s.description = "TODO: Description of ModelMirror."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7.1"

  s.add_development_dependency "pg"
end
