require 'pact'
require 'pact/message'
require 'pact/consumer/rspec'
require 'pact/message/consumer/rspec'

Pact.configure do |config|
  config.pact_dir = './contracts/consumer/pacts'
  config.pactfile_write_order = :alphabetical
end

Pact.message_consumer 'MyMessageConsumer' do
  has_pact_with 'MyMessageProvider' do
    mock_provider :my_message_provider do
      pact_specification_version '2.0.0'
    end
  end
end
