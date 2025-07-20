#!/data/data/com.termux/files/usr/bin/bash

# === RANGLAR (KONSOL UCHUN) ===
YASHIL="\033[1;32m"
QIZIL="\033[1;31m"
KO'K="\033[1;34m"
SARIQ="\033[1;33m"
RESET="\033[0m"
QALIN="\033[1m"

# === RAMKA CHIQARISH FUNKSIYASI ===
ramka() {
  echo -e "${KO'K}╔══════════════════════════════════════╗${RESET}"
  echo -e "${KO'K}║ ${SARIQ}$1${RESET}"
  echo -e "${KO'K}╚══════════════════════════════════════╝${RESET}"
}

# === XATOLARNI CHIQARISH FUNKSIYASI ===
xato() {
  echo -e "${QIZIL}╔══════════════════════════════════════╗"
  echo -e "║ ❌ XATO: $1"
  echo -e "╚══════════════════════════════════════╝${RESET}"
}

# === BOSHLASH ===
clear
ramka "🚀 Termux Super Yangilash boshlandi"

# === 1. PAKET RO‘YXATINI YANGILASH ===
ramka "🔄 Paketlar ro'yxatini yangilash..."
if ! pkg update -y; then
  xato "Paketlar ro‘yxatini yangilab bo‘lmadi"
  exit 1
fi

# === 2. O‘RNATILGAN PAKETLARNI YANGILASH ===
ramka "⬆️ O'rnatilgan paketlarni yangilash..."
if ! pkg upgrade -y; then
  xato "Paketlarni yangilab bo‘lmadi"
  exit 1
fi

# === 3. ISHLATILMAYDIGAN PAKETLARNI O‘CHIRISH ===
ramka "🧹 Keraksiz paketlarni o‘chirish..."
if ! apt autoremove -y; then
  xato "Keraksiz paketlarni o‘chirishda xato"
fi

# === 4. PAKET KESHINI TOZALASH ===
ramka "🧼 Paketlar keshini tozalash..."
if ! apt clean; then
  xato "Keshni tozalashda xato"
fi

# === 5. VAQTINCHALIK FAYLLARNI TOZALASH ===
ramka "🗑️ Vaqtinchalik va chiqindilarni o‘chirish..."
rm -rf ~/.cache/*
rm -rf /data/data/com.termux/cache/*
rm -rf /sdcard/.Trash/* 2>/dev/null

# === 6. DISK XOTIRASINI TEKSHIRISH ===
ramka "📊 Disk xotirasi holatini tekshirish..."
df -h | grep -E '^(/|/data|/dev|/sdcard)' || xato "Disk xotirasini tekshirib bo‘lmadi"

# === 7. INTERNET ULANISHINI TEKSHIRISH ===
ramka "🌐 Internetga ulanayotganini tekshirish..."
ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${YASHIL}✅ Internet ishlayapti${RESET}"
else
  xato "Internetga ulanib bo‘lmadi"
fi

# === 8. TERMUX ILOVASINI YANGILASH BO‘YICHA MASLAHAT ===
ramka "📥 Maslahat: Termux ilovasini F-Droid orqali qo‘lda yangilang!"

# === TAMOM — MUVAFFAQIYATLI ===
ramka "✅ Super Yangilash muvaffaqiyatli yakunlandi!"
