RSpec.describe 'DB schema', pact: :message do
  specify do
    my_message_provider
      .given('A state')
      .is_expected_to_send('A description')
      .with_content(Pact.like({
                                table1: {
                                  field11: :string,
                                  field12: :integer,
                                  field13: :boolean
                                },
                                table2: {
                                  field21: :string,
                                  field22: :text,
                                  field23: :float
                                }
                              }))

    my_message_provider.send_message_hash do |message|
      expect(message.keys).not_to be_empty
    end
  end
end
