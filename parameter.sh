#!/bin/bash

# 集計ファイルを作る？
# num_samples=30でいいのか？
# 2セットは2回回せばいいのか？
# 出力ファイルは分けるべき？
# メッセージサイズ=payload-size？

ENC=(plain aes) # 符号化(plain=無、aes=有)
COMP=(coff con) # 圧縮(coff=無、con=有)
SIZE=(1 10 100)
ORDER=(1st 2nd)
BROKER=(kafka mosquitto)

if [ ! -d {result/} ]; then
    mkdir result/
fi


for i in ${ENC[@]}
do
  for j in ${COMP[@]}
  do
    for k in ${SIZE[@]}
    do
      for l in ${ORDER[@]}
      do
        for m in ${BROKER[@]}
        do
        ./build/distributions/perftool-1.7.2/bin/perftool -s $i-$j-$m -f tsv > result/$i-$j-$k-$l-$m.tsv -n 30 -p $k
        #  echo $i-$j-$m
        done
      done
    done
  done
done


