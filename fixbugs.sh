#!/data/data/com.termux/files/usr/bin/bash

# 🔄 dpkg xatolarining oldini olish uchun lock fayllarni o‘chirish
echo "🔄 Lock fayllar o‘chirilmoqda..."
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock-frontend

# 🧹 pkg kesh va eskirgan fayllarni tozalash
echo "🧹 Tozalanmoqda..."
yes | pkg autoclean
yes | pkg clean

# 🛠 Buzilgan paketlarni tiklash va kerakli vositalarni qayta o‘rnatish
echo "🛠 Tiklanmoqda..."
dpkg --configure -a
pkg install -y termux-tools proot bash zsh coreutils util-linux busybox
pkg update -y && pkg upgrade -y

# ✅ Bajarildi!
echo "✅ Tayyor!"