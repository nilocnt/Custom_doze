#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

# Wait for boot to be completed
while [ `getprop vendor.post_boot.parsed` != "1" ]; do
    sleep 1s
done

# Apply settings
sleep 30s

# Disable Fsync
chmod 666 /sys/module/sync/parameters/fsync_enable
chown root /sys/module/sync/parameters/fsync_enable
echo "N" > /sys/module/sync/parameters/fsync_enable

# External SD Card Speed up
echo 'cfq' > /sys/block/mmcblk0/queue/scheduler
echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '1024' > /sys/block/mmcblk0/queue/nr_requests

fi;
