file=$1
cat $1 |cut -f 7-|less -S  | cut -c 1-100 | sort | uniq -c |sort -nk 1
