echo "Current meminfo" && free -h

sleep 5

echo "Clearing memory now"
echo 3 > /proc/sys/vm/drop_caches && free -h
