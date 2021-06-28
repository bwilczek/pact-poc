RSpec.describe 'DB schema', pact: :message do
  specify do
    my_message_provider
      .given('A state')
      .is_expected_to_send('A description')
      .with_content({key: 'value'})

    my_message_provider.send_message_hash do |message|
      expect(message.keys).not_to be_empty
    end
  end
end
