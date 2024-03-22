
################################################################ version 0.3 Beta ###########################################################################

#!/usr/bin/bash
# Author: Bilaluddin 
# Profile: DEVOPS
# version: V0.3

version="V0.3 Beta"

echo "this script can only be run on PR and DR"

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
BLUE="\e[34m"

echo -e "${BLUE}Version: $version ${ENDCOLOR}"

options(){
    echo -e "${GREEN}----------- Select Nodes Size --------------${ENDCOLOR}"
    echo "1. 3 Node cluster (Web1, Web2, Web4)"
    echo "2. 5 Node cluster (Web1, Web2, web3, Web4, web5)"
    echo "3. Run Basic Sanity"
    echo "4. check kafka if working/printing"
    echo -e "${GREEN}--------------------------------------------${ENDCOLOR}"
}

basic_sanity(){
    python3 /home/pluto/basic_sanity.py
}





if [ echo $setup == "DC" ]; then
    echo "Current Environment is ${GREEN} $setup ${ENDCOLOR}"
    
    3_node_kafka(){
    for x in SP3SIGNZYWEB1PROD SP3SIGNZYWEB2PROD SP3SIGNZYWEB4PROD ; do echo $x; echo srvr|nc $x 2181; echo; done 
}

5_node_kafka(){
    for x in SP3SIGNZYWEB1PROD SP3SIGNZYWEB2PROD SP3SIGNZYWEB3PROD SP3SIGNZYWEB4PROD SP3SIGNZYWEB5PROD; do echo $x; echo srvr|nc $x 2181; echo; done
}
    
    
    while true; do
    
kafka_msg_printing(){
    /home2/kafka/bin/kafka-console-consumer.sh --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SIGNZYWEB4PROD:5002 --topic $topic --max-messages 4
}

    options
    read -p "select any option: " option
    case $option in
        1) 3_node_kafka ;;
        2) 5_node_kafka ;;
        3) basic_sanity ;;
        4) kafka_msg_printing ;;
        *) echo -e "${RED}Invalid option selected ! Select from the option${ENDCOLOR}" ;;
    esac
    if [[ $option == 1 || $option == 2 || $option == 3 || $option == 4 ]]; then
        break
    fi
 done

else
    
    echo -e "Current Environment is ${GREEN} $setup ${ENDCOLOR}"
    3_node_kafka(){
    for x in DRSP3SIGNZYWEB1PROD DRSP3SIGNZYWEB2PROD DRSP3SIGNZYWEB4PROD ; do echo $x; echo srvr|nc $x 2181; echo; done 
}

5_node_kafka(){
    for x in DRSP3SIGNZYWEB1PROD DRSP3SIGNZYWEB2PROD DRSP3SIGNZYWEB3PROD DRSP3SIGNZYWEB4PROD DRSP3SIGNZYWEB5PROD; do echo $x; echo srvr|nc $x 2181; echo; done
}
    while true; do
    
    kafka_msg_printing(){
    /home2/kafka/bin/kafka-console-consumer.sh --bootstrap-server DRSP3SIGNZYWEB1PROD:5002,DRSP3SIGNZYWEB2PROD:5002,DRSP3SIGNZYWEB3PROD:5002,DRSP3SIGNZYWEB4PROD:5002,DRSP3SIGNZYWEB5PROD:5002 --topic $topic --max-messages 4
}
    
    options
    read -p "select any option: " option
    case $option in
        1) 3_node_kafka ;;
        2) 5_node_kafka ;;
        3) basic_sanity ;;
        4) kafka_msg_printing ;;
        *) echo -e "${RED}Invalid option selected ! Select from the option${ENDCOLOR}" ;;
    esac
   if [[ $option == 1 || $option == 2 || $option == 3 || $option == 4 ]]; then
        break
    fi
 done 
 


fi   #first block of if condition ends



<<comm

docker ps --format "Container ID: {{.ID}}, Status: {{.Status}}, Names: {{.Names}}"
/home2/kafka/bin/kafka-console-consumer.sh --bootstrap-server SP3SIGNZYWEB1PROD:5002,SP3SIGNZYWEB2PROD:5002,SIGNZYWEB4PROD:5002 --topic $topic --max-messages 4

/home2/kafka/bin/kafka-topics.sh --describe --bootstrap-server SP3SIGNZYWEB1PROD:5002 SP3SIGNZYWEB2PROD:5002  SP3SIGNZYWEB3PROD:5002 SIGNZYWEB4PROD:5002 SP3SIGNZYWEB5PROD:5002	



fi

if [ "$env" == "signzyDR" ]; then
    echo "$env" 
fi

comm
