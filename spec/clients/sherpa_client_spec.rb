require_relative '../spec_helper'

describe 'Sherpa client test' do
  describe Sherpa do
    use_vcr_cassette 'sherpa_client'

    it 'should be able to setup a basecamp connection' do
      Sherpa.setup_basecamp(BASECAMP_URL, BASECAMP_TOKEN)
      Basecamp.class.should == Sherpa.basecamp_client.class
    end

    it 'should be able to setup a Podio client' do
      Sherpa
    end

  end

end