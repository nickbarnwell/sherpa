require "bundler/setup"
require 'podio'
require 'basecamp'
require 'state_machine'

module Sherpa
  class << self
    def setup(basecamp, podio)
      Sherpa.setup_basecamp(basecamp[:url], basecamp[:token])
      Sherpa.setup_podio(podio)
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
      Sherpa.podio = Podio.client
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

  #TODO: Remove after tests are written - shouldn't be needed
  autoload :Convertible, 'sherpa/models/convertible'
  autoload :Message,    'sherpa/models/message'
  autoload :Project,    'sherpa/models/project'
  autoload :User,       'sherpa/models/user'
  autoload :Milestone,  'sherpa/models/milestone'
  autoload :Space,      'sherpa/models/space'
  autoload :PodioField, 'sherpa/models/podio_field'

end