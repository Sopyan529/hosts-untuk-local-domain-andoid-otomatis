#!/bin/sh

# Nama file output
output_file="/data/adb/domain/log"

# Fungsi untuk mendapatkan alamat IP dari interface tertentu
get_ip() {
    local interface=$1
    ip addr show "$interface" 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d/ -f1
}

# Loop untuk memeriksa IP secara berulang
while true; do
    # Mendapatkan IP dari interface ap0 dan rndis0
    ip_ap0=$(get_ip ap0)
    ip_rndis0=$(get_ip rndis0)

    # Menulis hasil ke file
    {
        if [ -z "$ip_ap0" ]; then
            echo "127.0.0.1 localhost"
        else
            echo "$ip_ap0 shafxer.local"
        fi

        if [ -z "$ip_rndis0" ]; then
            echo "127.0.0.1 localhost"
        else
            echo "$ip_rndis0 shafxer.local"
        fi
    } > "$output_file"
	cat "$output_file" > /etc/hosts
    # Tunggu selama 5 detik sebelum iterasi berikutnya
    sleep 3
done
