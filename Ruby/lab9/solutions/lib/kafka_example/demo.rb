
require "avro_turf"
require 'avro_turf/messaging'

class Demo
  def run
    # You need to pass the URL of your Schema Registry.
    avro = AvroTurf::Messaging.new(registry_url: "http://localhost:8081/")

    store = AvroTurf::SchemaStore.new(path: './lib/schemas')
    store.load_schemas!


    # The API for encoding and decoding data is similar to the default one. Encoding
    # data has the side effect of registering the schema. This only happens the first
    # time a schema is used.
    data = avro.encode({ "title" => "hello, world" }, schema_name: "greeting")

    ## This errors with:
    # Traceback (most recent call last):
    #         4: from bin/console:15:in `<main>'
    #         3: from (irb):70
    #         2: from /home/dhuffman/.asdf/installs/ruby/2.5.1/lib/ruby/gems/2.5.0/gems/avro_turf-1.6.0/lib/avro_turf/messaging.rb:104:in `encode'
    #         1: from /home/dhuffman/.asdf/installs/ruby/2.5.1/lib/ruby/gems/2.5.0/gems/avro_turf-1.6.0/lib/avro_turf/messaging.rb:137:in `rescue in encode'
    # AvroTurf::SchemaNotFoundError (Schema with subject: `` version: `` is not found on registry)

    # # If you don't want to automatically register new schemas, you can pass explicitly
    # # subject and version to specify which schema should be used for encoding.
    # # It will fetch that schema from the registry and cache it. Subsequent instances
    # # of the same schema version will be served by the cache.
    # data = avro.encode({ "title" => "hello, world" }, subject: 'greeting', version: 1)

    # # You can also pass explicitly schema_id to specify which schema
    # # should be used for encoding.
    # # It will fetch that schema from the registry and cache it. Subsequent instances
    # # of the same schema version will be served by the cache.
    # data = avro.encode({ "title" => "hello, world" }, schema_id: 2)

    # # Message can be validated before encoding to get a description of problem through
    # # Avro::SchemaValidator::ValidationError exception
    # data = avro.encode({ "titl" => "hello, world" }, schema_name: "greeting", validate: true)

    # # When decoding, the schema will be fetched from the registry and cached. Subsequent
    # # instances of the same schema id will be served by the cache.
    # avro.decode(data) #=> { "title" => "hello, world" }

    # # If you want to get decoded message as well as the schema used to encode the message,
    # # you can use `#decode_message` method.
    # result = avro.decode_message(data)
    # result.message       #=> { "title" => "hello, world" }
    # result.schema_id     #=> 3
    # result.writer_schema #=> #<Avro::Schema: ...>
    # result.reader_schema #=> nil

    # # You can also work with schema through this interface:
    # # Fetch latest schema for subject from registry
    # schema, schema_id = avro.fetch_schema(subject: 'greeting')
    # # Fetch specific version
    # schema, schema_id = avro.fetch_schema(subject: 'greeting', version: 1)
    # # Fetch schema by id
    # schema, schema_id = avro.fetch_schema_by_id(3)
    # # Register schema fetched from store by name
    # schema, schema_id = avro.register_schema(schema_name: 'greeting')
    # # Specify namespace (same as schema_name: 'somewhere.greeting')
    # schema, schema_id = avro.register_schema(schema_name: 'greeting', namespace: 'somewhere')
    # # Customize subject under which to register schema
    # schema, schema_id = avro.register_schema(schema_name: 'greeting', namespace: 'somewhere', subject: 'test')
  end
end
