#!/bin/sh

if [ x$1 = x ]; then
  echo "Usage : $0 <filename> <keyworkd>"
  exit 1
fi

fn=$1
kw=$2
# <- cnt=`wc -l "$fn" | awk '{print $1}'`
# <- line=`awk -F, 'BEGIN{FS=" "}{if ($1=="'${kw}'") print NR}' $fn`
line=`awk -F, 'BEGIN{OPS=" "}{print NR,$0}' $fn | grep -i ${kw} | tail -1 | awk 'BEGIN{FS=" "}{print $1}'`

rt=`grep "$kw" "$fn"`

if [ x = "x$rt" ]; then
  exit 0
fi

# <- position=`expr ${cnt} - ${line}`

more +"${line}" ${fn}

exit 0
