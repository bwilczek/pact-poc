#!/bin/bash

rm -rf consumer/contracts/consumer/pacts/*.json

cd consumer
bundle exec rspec contracts/consumer_spec.rb

cd ../provider
PACTFILE_URI=../consumer/contracts/consumer/pacts/mymessageconsumer-mymessageprovider.json bundle exec rake 'pact:verify:at[../consumer/contracts/consumer/pacts/mymessageconsumer-mymessageprovider.json]'
