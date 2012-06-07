require_relative '../spec_helper'

describe 'Sherpa client test' do
  describe Sherpa do
    use_vcr_cassette 'sherpa_client'

    let(:bhash) { {url: BASECAMP_URL, token: BASECAMP_TOKEN} }
    let(:phash) { {api_key: PODIO_KEY, api_secret: PODIO_SECRET}}
    # let(:sherpa) {Sherpa}

    it 'should be able to setup a basecamp connection' do
      Sherpa.setup_basecamp(bhash[:url], bhash[:token])
      Basecamp.class.should == Sherpa.basecamp_client.class
    end

    it 'should be able to setup a Podio client' do
      Sherpa.setup_podio(phash)
      Sherpa.podio.api_key.should == PODIO_KEY
      Sherpa.podio.api_secret.should == PODIO_SECRET
    end

    it 'should be able to login as a Podio user' do
      # binding.pry
      expect { Sherpa.podio.authenticate_with_credentials(
        API_SETTINGS['podio_mail'], API_SETTINGS['podio_pw']
      ) }.to_not raise_error
    end

    it 'should be able to make an arbitary request' do
      expect{
        Sherpa.podio.connection.get("/org/")
      }.to_not raise_error
    end

    it 'should be able to setup both clients at once' do
      pending "Having @Jamiehodge tell me what I'm doing wrong"
      Sherpa.setup(bhash, phash)
    end

  end

end