#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:cda361eafa12d075a29fa317f6c1da3cf5e46d5a > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:97345e462ef69256fd23b4c439478db59ab2ae4a \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:cda361eafa12d075a29fa317f6c1da3cf5e46d5a >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
