if [ $1 == 'start' ]; then
	set -e; for service in mysql.yabs skynetd yabs-storage clickhouse-server.yabs rsync.yabs  yabs-rsync-data yabs-file-transport yabs-scriptcontrol yabs-mkdb-*; do [ ! -e /etc/init.d/$service ] || sudo /etc/init.d/$service start; done; sudo telinit 3
elif [ $1 == 'stop' ]; then
	set -e; sudo telinit 2; for service in yabs-mkdb-* skynetd yabs-scriptcontrol yabs-file-transport yabs-rsync-data rsync.yabs clickhouse-server.yabs yabs-storage mysql.yabs; do [ ! -e /etc/init.d/$service ] || sudo /etc/init.d/$service stop; done; sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
else
	echo "no action"
fi
