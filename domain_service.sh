#!/system/bin/sh

(
    until [ $(getprop init.svc.bootanim) = "stopped" ]; do
        sleep 10
    done

    if [ -f "/data/adb/domain/autoip.sh" ]; then
        chmod 755 /data/adb/domain/autoip.sh
        su -c /data/adb/domain/autoip.sh
    else
        echo "File '/data/adb/domain.auto.sh' not found"
    fi
)&
