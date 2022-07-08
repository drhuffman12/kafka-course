
## Adding Kafka to your path (reminder)

1. Install (download and unzip) kafka_2.12-2.4.1`
2. Add to the 'bin' folder to your path

    ```
    ################################################################
    # Kafka
    KAFKA_HOME=/path/to/kafka_2.12-2.4.1
    PATH=$PATH:$KAFKA_HOME/bin
    export KAFKA_HOME
    export PATH
    ```

## Gotcha's

Book: "Kafka: The Definitive Guide"
  * https://st1.zoom.us/web_client/4qu8baa/html/externalLinkPage.html?ref=https://www.oreilly.com/library/view/kafka-the-definitive/9781491936153/
  * https://st1.zoom.us/web_client/4qu8baa/html/externalLinkPage.html?ref=https://www.oreilly.com/library/view/kafka-the-definitive/9781492043072/
  * 3rd edition in the works

### Error starting userland proxy: listen tcp4 0.0.0.0:2181: bind: address already in use

* If you try to `docker-compose up` (e.g.: when switching labs) and get an error like:

    ```
    $ docker-compose up
    Starting lab4_zookeeper_1 ... 
    Starting lab4_zookeeper_1 ... error

    ERROR: for lab4_zookeeper_1  Cannot start service zookeeper: driver failed programming external connectivity on endpoint lab4_zookeeper_1 (e58525bc89e7159e3a361ee3499a5b345792772bc7beb807ca96c693859a40f5): Error starting userland proxy: listen tcp4 0.0.0.0:2181: bind: address already in use

    ERROR: for zookeeper  Cannot start service zookeeper: driver failed programming external connectivity on endpoint lab4_zookeeper_1 (e58525bc89e7159e3a361ee3499a5b345792772bc7beb807ca96c693859a40f5): Error starting userland proxy: listen tcp4 0.0.0.0:2181: bind: address already in use
    ERROR: Encountered errors while bringing up the project.
    ```

  * Solution:

    ```
    $ sudo netstat -ltnp | grep 2181
    tcp6       0      0 :::2181                 :::*                    LISTEN      1568/java   
    $ sudo kill 1568
    
    ```
  
### Kafka Image env var's

See:
  * https://github.com/rawmind0/alpine-kafka/blob/master/README.md
  * https://kafka.apache.org/documentation/
  * https://kafka.apache.org/documentation/#brokerconfigs_offsets.topic.replication.factor
  * https://docs.confluent.io/platform/current/installation/configuration/broker-configs.html

### watermark

Comparison of offsets between leader and follower.

If follower with highest watermark gets elected to primary.

## Running examples

## Sending Objects instead of just String

subjects == schema

