require "avro_turf"
require_relative "./kafka_api"
class AvroTurf::SchemaStore
  attr_reader :schemas
end

module KafkaExample
  class Lab9ExampleAvro
    TOPIC_DEFAULT = 'my_orders2'
    KAFKA = KafkaApi.kafka

    def avro
      # You need to pass the URL of your Schema Registry.
      avro = AvroTurf::Messaging.new(registry_url: "http://localhost:8081/")
    end

    def run
      puts "** #{self.class.name}##{__method__}"

      # Encoding data has the side effect of registering the schema. This only
      # happens the first time a schema is used with the instance of `AvroTurf`.
      data = avro.encode({ "title" => "hello, world" }, schema_name: "greeting")

      # Assuming you've set up `producer`:
      KAFKA.producer.produce(data, topic: "disasters")
    end

    def read_object
      # You need to pass the URL of your Schema Registry.
      avro = AvroTurf::Messaging.new(registry_url: "http://my-registry:8081/")

      KAFKA.each_message(topic: "disasters") do |message|
        # By passing in `schema_name:`, you guard against the producer changing
        # the schema in an incompatible way. You can leave out the argument, in
        # which case you'll just get whatever data the producer encoded out, with
        # no schema compatibility guarantees.
        greeting = avro.decode(message.value, schema_name: "greeting")
        greeting #=> { "title" => "hello, world" }
      end
    end

    def log
      puts "** #{self.class.name}##{__method__}"
      KafkaExample::KafkaApi.log(TOPIC_DEFAULT)
    end

    private

    def rand_val
      (10..100000).to_a.sample
    end
  end
end
