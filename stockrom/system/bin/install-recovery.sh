#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12257280 dd189d0274f99b5d82b3523777c065e5443c931f 9572352 397a3f08ec077cfe0ee943e7c40692791e7c55d3
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12257280:dd189d0274f99b5d82b3523777c065e5443c931f; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:9572352:397a3f08ec077cfe0ee943e7c40692791e7c55d3 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery dd189d0274f99b5d82b3523777c065e5443c931f 12257280 397a3f08ec077cfe0ee943e7c40692791e7c55d3:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
