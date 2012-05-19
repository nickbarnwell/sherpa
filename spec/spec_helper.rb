# This file is copied to spec/ when you run 'rails generate rspec:install'
require "bundler/setup"
require 'rspec/autorun'
require 'factory_girl'
require 'vcr'
require 'pry'

require 'sherpa'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
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

secrets = YAML::load( File.open( 'spec/secrets.yml' ) )
p secrets
BASECAMP_TOKEN = secrets['bc_token']
BASECAMP_URL = secrets['bc_url']
PODIO_TOKEN = secrets['p_token']
PODIO_SECRET = secrets['p_secret']