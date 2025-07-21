#!/data/data/com.termux/files/usr/bin/bash

# === COLORS (ANSI kodlari) ===
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# === RAMKA CHIQARISH FUNKSIYASI ===
frame() {
  echo -e "${BLUE}╔════════════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║ ${YELLOW}$1${RESET}"
  echo -e "${BLUE}╚════════════════════════════════════════════╝${RESET}"
}

# === XATO CHIQARISH ===
error() {
  echo -e "${RED}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ ERROR: $1"
  echo -e "╚════════════════════════════════════════════╝${RESET}"
}

# === DASTURLAR RO‘YXATI + IZOH ===
described_packages=(
  "curl       - URL dan fayl yuklash"
  "wget       - fayl yuklash"
  "git        - versiyalarni boshqarish"
  "nano       - oddiy matn muharriri"
  "vim        - professional matn muharriri"
  "unzip      - .zip arxivdan chiqarish"
  "tar        - .tar fayllarni ochish"
  "zip        - fayllarni arxivlash"
  "tree       - papkalarni daraxt ko‘rinishda ko‘rsatish"
  "coreutils  - UNIX buyruqlar to‘plami"
  "htop       - jarayonlarni kuzatish"
  "neofetch   - tizim haqida ma'lumot"
  "proot      - izolyatsiyalangan muhit"
  "termux-api - Android funksiyalariga kirish"
  "openssh    - SSH mijozi/serveri"
  "dnsutils   - DNS vositalari (nslookup va boshqalar)"
  "busybox    - UNIX vositalari to‘plami"
  "inxi       - tizim haqida to‘liq ma'lumot"
  "perl       - inxi uchun kerak"
  "nmap       - portlarni tekshirish"
  "whois      - domen haqida ma'lumot"
  "traceroute - tarmoq marshrutini aniqlash"
  "python     - Python dasturlash tili"
  "python-pip - Python paket menejeri"
  "nodejs     - JavaScript muhiti"
  "php        - PHP dasturlash muhiti"
  "clang      - C/C++ kompilyatori"
  "ruby       - Ruby dasturlash tili"
  "golang     - Go dasturlash tili"
  "rust       - Rust dasturlash tili"
  "figlet     - ASCII bannerlar"
  "toilet     - bannerlar uchun uslub"
  "lolcat     - rangli chiqarish (gem orqali o‘rnatiladi)"
)

# === O‘RNATILADIGAN PAKETLAR RO‘YXATI (pkg orqali) ===
packages=(
  curl wget git nano vim unzip tar zip tree coreutils
  htop neofetch proot termux-api openssh dnsutils busybox inxi perl
  nmap whois traceroute
  python python-pip nodejs php clang ruby golang rust
  figlet toilet
)

# === DASTURLAR RO‘YXATINI CHIQARISH ===
clear
frame "🧰 Quyidagi dasturlar o‘rnatiladi:"

for line in "${described_packages[@]}"; do
  echo -e "${GREEN}  $line${RESET}"
done

echo
read -p "❓ Davom ettiraylikmi? (y/n): " confirm
if [[ $confirm != "y" && $confirm != "Y" ]]; then
  frame "⛔ O‘rnatish foydalanuvchi tomonidan bekor qilindi"
  exit 0
fi

# === PAKETLARNI YANGILASH ===
frame "🔄 Paketlar ro‘yxati yangilanmoqda..."
yes | pkg update > /dev/null 2>&1
yes | pkg upgrade > /dev/null 2>&1

# === PAKETLARNI O‘RNATISH ===
frame "🚀 Dasturlarni o‘rnatish boshlandi..."

for pkg in "${packages[@]}"; do
  frame "📥 O‘rnatilmoqda: $pkg"
  if pkg install -y "$pkg" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ O‘rnatildi: $pkg${RESET}"
  else
    error "Xatolik yuz berdi: $pkg"
  fi
done

# === lolcat NI O‘RNATISH (gem orqali) ===
frame "🌈 lolcat gem orqali o‘rnatilmoqda..."
if gem install lolcat > /dev/null 2>&1; then
  echo -e "${GREEN}✅ lolcat gem orqali o‘rnatildi${RESET}"
else
  error "lolcat ni gem orqali o‘rnatib bo‘lmadi"
fi

# === YAKUNIY XABAR ===
frame "✅ Barcha dasturlar muvaffaqiyatli o‘rnatildi!"