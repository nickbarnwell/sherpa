# This file is copied to spec/ when you run 'rails generate rspec:install'
require "bundler/setup"

require 'sherpa' #There's probably a better way to do this

require 'rspec/autorun'
require 'factory_girl'
require 'vcr'
require 'pry'



RSpec.configure do |config|
  config.mock_with :rspec

  #Configure VCR
  config.extend VCR::RSpec::Macros
  config.include FactoryGirl::Syntax::Methods
end

VCR.configure do |config|
  config.cassette_library_dir     = 'spec/cassettes'
  config.hook_into                :webmock
  config.default_cassette_options = { :record => :new_episodes }
end

API_SETTINGS = YAML::load( File.open( 'spec/secrets.yml' ) )

BASECAMP_TOKEN = API_SETTINGS['basecamp_token']
BASECAMP_URL = API_SETTINGS['basecamp_url']
PODIO_KEY = API_SETTINGS['podio_api_key']
PODIO_SECRET = API_SETTINGS['podio_api_secret']