#!/bin/bash

# 圧縮やめる

ENC=(plain aes) # 符号化(plain=無、aes=有)
COMP=(coff) # 圧縮(coff=無、con=有)
SIZE=(1024 10240 102400)  # 単位byte
ORDER=(1st 2nd)
BROKER=(kafka mosquitto)


# rm result/*.tsv

# if [ ! -d {result/} ]; then
#     mkdir result/
# fi
if [ ! -d {result_LTE/} ]; then
    mkdir result_LTE/
fi

for l in ${ORDER[@]}
do
  for i in ${ENC[@]}
  do
    for j in ${COMP[@]}
    do
      for k in ${SIZE[@]}
      do
        for m in ${BROKER[@]}
        do
         echo $i-$j-$k-$l-$m
        ./build/distributions/perftool-1.7.2/bin/perftool -c 10 -n 100 -p $k -s $i-$j-$m -f tsv > result_LTE/$i-$j-$k-$l-$m.tsv 
        done
      done
    done
  done
done


