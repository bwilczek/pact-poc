require 'pact'
require 'pact/message'

Pact.provider_states_for 'MyMessageConsumer' do
  provider_state 'A state' do
    no_op
  end
end

Pact.message_provider 'MyMessageProvider' do
  honours_pact_with 'MyMessageConsumer' do
    pact_uri ENV['PACTFILE_URI']
  end

  builder do |message_description|
    { key: 'value' }
  end
end
