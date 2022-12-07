#!/bin/bash

ENC=(plain aes) # 符号化(plain=無、aes=有)
COMP=(coff con) # 圧縮(coff=無、con=有)
BROKER=(kafka mosquitto)

touch .sinetstream_config.yml

for i in ${ENC[@]}
do
  for j in ${COMP[@]}
  do
    for m in ${BROKER[@]}
    do
    echo $i-$j-$m: >> .sinetstream_config.yml
    if [ $m = "kafka" ]; then
        echo " "type: kafka >> .sinetstream_config.yml
        echo " "brokers: \"kafka.mdx:9092\" >> .sinetstream_config.yml
        echo " "topic: topic-perftool-kafka >> .sinetstream_config.yml
    else
        echo  " "type: mqtt >> .sinetstream_config.yml
        echo " "brokers: \"mqtt.mdx:1883\" >> .sinetstream_config.yml
        echo " "topic: topic-perftool-mqtt >> .sinetstream_config.yml
    fi
    if [ $j = "con" ]; then
        echo  " "data_compression: true  >> .sinetstream_config.yml
    fi
    if [ $i = "aes" ]; then
        echo  " "crypto:'\n'" "" "algorithm: AES  >> .sinetstream_config.yml
    fi
    done
  done
done