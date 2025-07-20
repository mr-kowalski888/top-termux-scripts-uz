#!/data/data/com.termux/files/usr/bin/bash

# === RANGLAR ===
YASHIL="\033[1;32m"
QIZIL="\033[1;31m"
KO'K="\033[1;34m"
SARIQ="\033[1;33m"
TIKLA="\033[0m"

# === RAMKA CHIQARISH FUNKSIYASI ===
ramka() {
  echo -e "${KO'K}╔════════════════════════════════════════════╗${TIKLA}"
  echo -e "${KO'K}║ ${SARIQ}$1${TIKLA}"
  echo -e "${KO'K}╚════════════════════════════════════════════╝${TIKLA}"
}

# === XATO CHIQARISH ===
xato() {
  echo -e "${QIZIL}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ XATO: $1"
  echo -e "╚════════════════════════════════════════════╝${TIKLA}"
}

# === BOSHLASH ===
clear
ramka "🧹 Termux tozalash boshlandi"

# === 1. APT KESHNI TOZALASH ===
ramka "🧼 APT paket keshini tozalash..."
if ! apt clean; then
  xato "apt keshi tozalanmadi"
fi

# === 2. FOYDALANILMAGAN PAKETLARNI O‘CHIRISH ===
ramka "🗑️ Keraksiz paketlarni o‘chirish..."
if ! apt autoremove -y; then
  xato "autoremove ishlamadi"
fi

# === 3. ~/.cache NI TOZALASH ===
ramka "📂 ~/.cache papkasini tozalash..."
rm -rf ~/.cache/*

# === 4. TERMUX ICHKI KESHINI TOZALASH ===
ramka "📂 Termux ichki keshini tozalash..."
rm -rf /data/data/com.termux/cache/*

# === 5. SD-KARTA TRASH FAYLLARINI TOZALASH ===
ramka "🗑️ /sdcard/.Trash ni tozalash..."
rm -rf /sdcard/.Trash/* 2>/dev/null

# === 6. BUYRUQLAR TARIXINI O‘CHIRISH ===
ramka "📜 Bash yoki Zsh tarixini tozalash..."
rm -f ~/.bash_history ~/.zsh_history

# === 7. LOCK VA LOG FAYLLARNI O‘CHIRISH ===
ramka "🔐 Lock va log fayllarni o‘chirish..."
rm -f /data/data/com.termux/files/usr/var/lib/apt/lists/lock
rm -f /data/data/com.termux/files/usr/var/cache/apt/archives/lock
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock

# === 8. XOTIRA HOLATINI KO‘RISH ===
ramka "📊 Bo‘sh joy holati:"
df -h | grep -E '^(/|/data|/dev|/sdcard)'

# === TUGADI ===
ramka "✅ Termux tozalash yakunlandi!"
