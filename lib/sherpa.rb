require "bundler/setup"
require 'podio'
require 'basecamp'
require 'state_machine'

module Sherpa
  class << self
    def setup(basecamp, podio)
      sherpa = Sherpa.new
      sherpa.setup_basecamp(basecamp[:url], basecamp[:token])
      sherpa.setup_podio(podio)
    end

    def setup_basecamp(url, token)
      Basecamp.
        establish_connection!(url,
            token,
            'X', #bogus
            true #SSL enabled
          );
      Sherpa.basecamp_client = Basecamp
    end

    def setup_podio(options={})
      Podio.setup(options)
      podio = Podio
    end

    def basecamp_client
      Thread.current[:bc_client]
    end

    def basecamp_client=(new_client)
      Thread.current[:bc_client] = new_client
    end

    def podio
      Thread.current[:podio_client]
    end

    def podio=(new_client)
      Thread.current[:podio_client] = new_client
    end
  end

  autoload :Message,    'sherpa/models/message'
  autoload :Project,    'sherpa/models/project'
  autoload :User,       'sherpa/models/user'
  autoload :Milestone,  'sherpa/models/milestone'
end