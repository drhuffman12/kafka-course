# frozen_string_literal: true

require_relative "kafka_example/version"
require_relative "kafka_example/kafka_api"
# require_relative "kafka_example/example_us_states.rb"
require_relative "kafka_example/lab4_example_storms.rb"

module KafkaExample
  class Error < StandardError; end
end

example = KafkaExample::Lab4ExampleStorms.new
example.run
# example.consume
# example.consume_v2
# example.consume_loop
puts "consumed!"
example.log
