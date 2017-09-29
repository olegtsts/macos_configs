regexp=$1
output_file=$2
if [ ! $regexp ]; then echo "$0 regexp output_file"; exit 0;fi
if [ ! $output_file ]; then echo "$0 regexp output_file"; exit 0;fi

while [ 1 ]; do date >> $output_file;  mysql -uroot yabsdb -e 'show full processlist' | grep -v Sleep | grep -E $regexp >> $output_file; sleep 1;done
