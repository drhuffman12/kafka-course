# frozen_string_literal: true
require "avro_turf"
require 'avro_turf/messaging'

require_relative "kafka_example/version"
require_relative "kafka_example/kafka_api"
# require_relative "kafka_example/example_us_states.rb"
# require_relative "kafka_example/lab9_example_avro"
require_relative "kafka_example/demo"

module KafkaExample
  class Error < StandardError; end
end

# Demo.new.run

# store = AvroTurf::SchemaStore.new(path: 'lib/schemas')
# store.load_schemas!

# # Accessing 'person' is correct and works fine.
# # person = store.find('DisasterValue', 'contacts') # lib/schemas/contacts/DisasterValue.avsc exists

# data = avro.encode({ "name" => "hello, world" }, schema_name: "DisasterValue")
# person = store.find('DisasterValue', 'honolulu')


# example = KafkaExample::Lab9ExampleAvro.new
# example.run
# example.read_object
# example.log
