#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10254336:f6c366f9267bd7d6882fd26dfbcc3e2e1497589b; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:9375744:3d4238b3ab88eb0b5d7a2ece192c5ff024560e1e EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery f6c366f9267bd7d6882fd26dfbcc3e2e1497589b 10254336 3d4238b3ab88eb0b5d7a2ece192c5ff024560e1e:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
