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

  builder do |_message_description|
    {
      table1: {
        field11: :string,
        field12: :integer,
        field13: :boolean
      },
      table2: {
        field21: :string,
        field22: :text,
        field23: :float,
        field24: :decimal
      }
    }
  end
end
