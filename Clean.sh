echo "Done"
while true; do
  pm trim-caches 99999999999G 2>/dev/null

  rm -rf /data/dalvik-cache/* 2>/dev/null
  rm -rf /data/resource-cache/* 2>/dev/null
  rm -rf /data/cache/* 2>/dev/null
  rm -rf /data/local/tmp/* 2>/dev/null
  rm -rf /data/anr/* 2>/dev/null
  rm -rf /data/tombstones/* 2>/dev/null
  rm -rf /data/system/dropbox/* 2>/dev/null
  rm -rf /data/system/usagestats/* 2>/dev/null
  rm -rf /data/system/logs/* 2>/dev/null
  rm -rf /data/system/notifications/logs/* 2>/dev/null
  rm -rf /data/system/trace/* 2>/dev/null
  rm -rf /data/system/diagnostic/* 2>/dev/null
  rm -rf /data/tmp/* 2>/dev/null
  rm -rf /data/log/* 2>/dev/null
  rm -rf /data/logs/* 2>/dev/null
  rm -rf /data/crash/* 2>/dev/null
  rm -rf /data/error/* 2>/dev/null
  rm -rf /data/trace/* 2>/dev/null
  rm -rf /data/debug/* 2>/dev/null
  rm -rf /data/dump/* 2>/dev/null
  rm -rf /data/bugreports/* 2>/dev/null
  rm -rf /data/misc/logd/* 2>/dev/null
  rm -rf /data/misc/bluetooth/logs/* 2>/dev/null
  rm -rf /data/misc/audit/* 2>/dev/null
  rm -rf /data/misc/perfprofd/* 2>/dev/null
  rm -rf /data/misc/textclassifier/* 2>/dev/null
  rm -rf /data/misc/user/*/textclassifier/* 2>/dev/null

  rm -rf /cache/* /mnt/cache/* /mnt/sdcard/cache/* 2>/dev/null
  rm -rf /mnt/runtime/*/cache/* 2>/dev/null
  rm -rf /mnt/runtime/*/Android/data/*/cache/* 2>/dev/null

  find /sdcard/Android/data -type d \( -iname '*log*' -o -iname '*tmp*' -o -iname '*temp*' -o -iname '*debug*' -o -iname '*trace*' -o -iname '*crash*' -o -iname '*error*' \) -exec rm -rf {}/* 2>/dev/null \;

  rm -rf /sdcard/Android/media/.thumbnails/* 2>/dev/null
  rm -rf /sdcard/DCIM/.thumbnails/* 2>/dev/null
  rm -rf /sdcard/DCIM/.cache/* 2>/dev/null
  rm -rf /sdcard/Pictures/.thumbnails/* 2>/dev/null
  rm -rf /sdcard/Pictures/.cache/* 2>/dev/null

  rm -rf /sdcard/Temp/* /sdcard/tmp/* /sdcard/.tmp/* /sdcard/.cache/* 2>/dev/null
  rm -rf /sdcard/.log/* /sdcard/.debug_log/* /sdcard/.trace/* /sdcard/.crash/* /sdcard/.tombstone/* 2>/dev/null
  rm -rf /sdcard/LOST.DIR/* /sdcard/backups/.tmp/* 2>/dev/null

  rm -rf /sdcard/tencent/*/log/* 2>/dev/null
  rm -rf /sdcard/tencent/*/.log/* 2>/dev/null
  rm -rf /sdcard/tencent/*/.crash/* 2>/dev/null
  rm -rf /sdcard/tencent/*/.dump/* 2>/dev/null
  rm -rf /sdcard/tencent/MobileQQ/.log/* 2>/dev/null
  rm -rf /sdcard/tencent/MobileQQ/.nomedia/* 2>/dev/null
  rm -rf /sdcard/tencent/QQfile_recv/.tmp/* 2>/dev/null
  rm -rf /sdcard/tencent/QQBrowser/.crash/* 2>/dev/null
  rm -rf /sdcard/tencent/QQBrowser/.log/* 2>/dev/null
  rm -rf /sdcard/MIUI/debug_log/* /sdcard/MIUI/.debug_log/* 2>/dev/null
  rm -rf /sdcard/Alipay/.log/* /sdcard/Alipay/.temp/* /sdcard/.UTSystemConfig/Global/Alipay/* 2>/dev/null
  rm -rf /sdcard/UCDownloads/.log/* /sdcard/UCDownloads/tmp/* 2>/dev/null
  rm -rf /sdcard/WeChat/logs/* 2>/dev/null
  rm -rf /sdcard/DingTalk/log/* 2>/dev/null
  rm -rf /sdcard/Douyin/.log/* /sdcard/Douyin/crash/* 2>/dev/null
  rm -rf /sdcard/Kuaishou/.log/* /sdcard/Kuaishou/debug/* 2>/dev/null
  rm -rf /sdcard/Baidu/.log/* /sdcard/Baidu/.crash/* 2>/dev/null
  rm -rf /sdcard/com.facebook.orca/cache/* /sdcard/com.facebook.katana/cache/* 2>/dev/null
  rm -rf /sdcard/com.zhiliaoapp.musically/.log/* 2>/dev/null
  rm -rf /sdcard/Android/data/com.android.vending/files/crash_reports/* 2>/dev/null

  rm -rf /sdcard/Download/*.log /sdcard/Download/*.tmp /sdcard/Download/*.temp 2>/dev/null
  rm -rf /sdcard/Download/.temp/* /sdcard/Download/.log/* 2>/dev/null

  find /sdcard -type f \( -iname '*.log' -o -iname '*.tmp' -o -iname '*.temp' -o -iname '*.crash' -o -iname '*.trace' -o -iname '*.bak' -o -iname '.*.log' -o -iname '.*.tmp' \) -delete 2>/dev/null

  sleep 300
done
