#!/bin/bash

#topic=$1
#
#/home2/kafka/bin/kafka-console-consumer.sh --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SIGNZYWEB4PROD:5002 --topic  $topic

#/home2/kafka/bin/kafka-topics.sh --alter --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SP3SIGNZYWEB4PROD:5002  --topic ckyc_inputs --partitions 200

#/home2/kafka/bin/kafka-topics.sh --create --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SP3SIGNZYWEB4PROD:5002  --topic dummy_tpic --partitions 5 --replication-factor 3


#!/bin/bash

# Check the status of nginx, zookeeper, and kafka services
echo "Checking service status..."
service_status_nginx=$(systemctl is-active nginx)
service_status_zookeeper=$(systemctl is-active zookeeper)
service_status_kafka=$(systemctl is-active kafka)

if [ "$service_status_nginx" = "active" ]; then
    echo "nginx is active"
else
    echo "nginx is not active"
fi

if [ "$service_status_zookeeper" = "active" ]; then
    echo "zookeeper is active"
else
    echo "zookeeper is not active"
fi

if [ "$service_status_kafka" = "active" ]; then
    echo "kafka is active"
else
    echo "kafka is not active"
fi

# Check if specific ports are listening
echo "Testing network connectivity..."
time nc -vz example.com 443
time nc -vz hostname 5001 443 9206

# Display mount usage
echo "Displaying mount usage..."
echo "/ mount usage:"
df -h /
echo "/var mount usage:"
df -h /var
