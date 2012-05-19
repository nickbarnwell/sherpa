require 'rubygems'

Gem::Specification.new do |gem|
  gem.name = 'sherpa'
  gem.version = '0.0.1'
  gem.summary = %Q{Basecamp API Exporter & Podio Importer.}
  gem.description = %Q{Gem for handling Basecamp Classic to Podio Export}
  gem.email = "nick@boltoncomputing.com"
  gem.homepage = "http://github.com/nickbarnwell/sherpa"
  gem.authors = ['Nick Barnwell']
  
  gem.files = Dir.glob("{lib}/**/*")
  
  gem.add_dependency  'podio', '>= 0.7.0'
  gem.add_dependency  'basecamp', '>= 0.0.10'
  gem.add_dependency  'state_machine',    '>= 1.1.2'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'factory_girl'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'pry'

end
