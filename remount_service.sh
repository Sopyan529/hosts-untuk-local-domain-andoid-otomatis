#!/system/bin/sh

(
    until [ $(getprop init.svc.bootanim) = "stopped" ]; do
        sleep 15
    done

    if [ -f "/data/adb/domain/autoip.sh" ]; then
        chmod 755 /data/adb/domain/remount.sh
        su -c /data/adb/domain/remount.sh
    else
        echo "File '/data/adb/domain.auto.sh' not found"
    fi
)&