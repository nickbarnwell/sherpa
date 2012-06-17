require_relative '../spec_helper'



describe 'User Model' do
  use_vcr_cassette 'user'

  let(:client) {Basecamp.establish_connection!(BASECAMP_URL,
    BASECAMP_TOKEN,
    'X',
    true);
   
   Basecamp
  }

  it 'should be able to create a Podio model from a user' do
    p Sherpa::User.new(client::Person.me).to_podio
  end
end