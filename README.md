```sh
cd consumer
bundle install
bundle exec rspec contracts/consumer_spec.rb

cd ../provider
bundle install
PACTFILE_URI=../consumer/contracts/consumer/pacts/mymessageconsumer-mymessageprovider.json bundle exec rake 'pact:verify:at[../consumer/contracts/consumer/pacts/mymessageconsumer-mymessageprovider.json]'
```