#!/data/data/com.termux/files/usr/bin/bash

# === RANGLAR UCHUN O‘ZGARUVCHILAR ===
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# === RAMKALI CHIQARISH FUNKSIYASI ===
frame() {
  echo -e "${BLUE}╔════════════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║ ${YELLOW}$1${RESET}"
  echo -e "${BLUE}╚════════════════════════════════════════════╝${RESET}"
}

# === XATO XABARLARINI CHIQARISH FUNKSIYASI ===
error() {
  echo -e "${RED}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ XATO: $1"
  echo -e "╚════════════════════════════════════════════╝${RESET}"
}

# === TOZALASHNI BOSHLASH ===
clear
frame "🧹 Termux tozalash jarayoni boshlandi"

# === 1. APT KESHINI TOZALASH ===
frame "🧼 APT paketlar keshini tozalash..."
if ! apt clean; then
  error "apt keshini tozalab bo‘lmadi"
fi

# === 2. KERAKSIZ PAKETLARNI O‘CHIRISH ===
frame "🗑️ Keraksiz paketlarni o‘chirish..."
if ! apt autoremove -y; then
  error "autoremove bajarilmadi"
fi

# === 3. ~/.cache PAPKASINI TOZALASH ===
frame "📂 ~/.cache papkasini tozalash..."
[[ -d ~/.cache ]] && rm -rf ~/.cache/*

# === 4. TERMUX ICHKI KESHINI TOZALASH ===
frame "📂 Termux ichki keshini tozalash..."
[[ -d /data/data/com.termux/cache ]] && rm -rf /data/data/com.termux/cache/*

# === 5. SD-KARTADAGI .Trash NI TOZALASH ===
frame "🗑️ /sdcard/.Trash fayllarini o‘chirish..."
rm -rf /sdcard/.Trash/* 2>/dev/null

# === 6. BUYRUQLAR TARIXINI TOZALASH (bash/zsh) ===
frame "📜 Buyruqlar tarixini tozalash..."
rm -f ~/.bash_history ~/.zsh_history

# === 7. LOCK VA LOG FAYLLARNI O‘CHIRISH ===
frame "🔐 APT lock va log fayllarni o‘chirish..."
rm -f /data/data/com.termux/files/usr/var/lib/apt/lists/lock
rm -f /data/data/com.termux/files/usr/var/cache/apt/archives/lock
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock

# === 8. XOTIRA FOYDALANISHINI KO‘RISH ===
frame "📊 Xotira ishlatilishi:"
df -h | grep -E '^(/|/data|/dev|/sdcard)'

# === YAKUNIY XABAR ===
frame "✅ Tozalash muvaffaqiyatli yakunlandi!"