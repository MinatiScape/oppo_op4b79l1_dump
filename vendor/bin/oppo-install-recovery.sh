#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:197ca5949883e4b779ccb431fc8eee4ee4fda4c4; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:ae2dcf618a4617629406f0b177ccf274e048ad34 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:197ca5949883e4b779ccb431fc8eee4ee4fda4c4 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
