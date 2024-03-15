#!/bin/bash

#topic=$1
#
#/home2/kafka/bin/kafka-console-consumer.sh --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SIGNZYWEB4PROD:5002 --topic  $topic

/home2/kafka/bin/kafka-topics.sh --alter --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SP3SIGNZYWEB4PROD:5002  --topic ckyc_inputs --partitions 200

/home2/kafka/bin/kafka-topics.sh --create --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SP3SIGNZYWEB4PROD:5002  --topic dummy_tpic --partitions 5 --replication-factor 3

