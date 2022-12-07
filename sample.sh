#!/bin/bash

ENC=(plain aes)
COMP=(coff con)

for i in ${ENC[@]}
do
  for j in ${COMP[@]}
  do
  echo $i-$j
  done
done

