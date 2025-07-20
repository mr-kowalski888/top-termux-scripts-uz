#!/data/data/com.termux/files/usr/bin/bash

# === RANGLAR ===
YASHIL="\033[1;32m"
QIZIL="\033[1;31m"
KO‘K="\033[1;34m"
SARIQ="\033[1;33m"
TIKLA="\033[0m"

# === RAMKA CHIQARISH FUNKSIYASI ===
ramka() {
  echo -e "${KO‘K}╔════════════════════════════════════════════╗${TIKLA}"
  echo -e "${KO‘K}║ ${SARIQ}$1${TIKLA}"
  echo -e "${KO‘K}╚════════════════════════════════════════════╝${TIKLA}"
}

# === XATO CHIQARISH ===
xato() {
  echo -e "${QIZIL}╔════════════════════════════════════════════╗"
  echo -e "║ ❌ XATO: $1"
  echo -e "╚════════════════════════════════════════════╝${TIKLA}"
}

# === DASTURLAR RO‘YXATI + IZOH ===
izohli_dasturlar=(
  "curl       - URL dan fayl olish"
  "wget       - fayl yuklash"
  "git        - versiyalarni boshqarish"
  "nano       - oddiy matn muharriri"
  "vim        - professional matn muharriri"
  "unzip      - .zip arxivdan chiqarish"
  "tar        - .tar fayllarni ochish"
  "zip        - fayllarni arxivlash"
  "tree       - papkalarni daraxt ko‘rinishda ko‘rsatish"
  "coreutils  - UNIX buyruqlar to‘plami"
  "htop       - jarayonlarni ko‘rish monitori"
  "neofetch   - tizim ma'lumotlarini ko‘rsatish"
  "proot      - root bo‘lmasdan Linux ishga tushirish"
  "termux-api - Android funksiyalariga kirish"
  "openssh    - SSH mijozi/serveri"
  "dnsutils   - DNS vositalari"
  "busybox    - UNIX vositalari to‘plami"
  "inxi       - tizim haqida to‘liq ma'lumot"
  "perl       - inxi ishlashi uchun kerak"
  "nmap       - portlarni skaner qilish"
  "netcat     - tarmoqni sinash"
  "whois      - domen haqida ma'lumot"
  "traceroute - tarmoq yo‘lini aniqlash"
  "python     - dasturlash tili"
  "python-pip - Python kutubxona boshqaruvi"
  "nodejs     - JavaScript muhit"
  "php        - PHP ishlovchi muhiti"
  "clang      - C/C++ kompilyator"
  "ruby       - Ruby tili"
  "golang     - Go tili"
  "rust       - Rust dasturlash tili"
  "figlet     - ASCII bannerlar"
  "toilet     - rangli bannerlar"
  "lolcat     - rainbow uslubdagi rangli chiqarish"
  "apt        - paket boshqaruvchisi"
  "pkg        - Termux uchun soddalashtirilgan boshqaruvchi"
)

# === FAOL DASTURLAR NOMLARI ===
paketlar=(
  curl wget git nano vim unzip tar zip tree coreutils
  htop neofetch proot termux-api openssh dnsutils busybox inxi perl
  nmap netcat whois traceroute
  python python-pip nodejs php clang ruby golang rust
  figlet toilet lolcat apt pkg
)

# === RO‘YXATNI CHIQARISH ===
clear
ramka "🧰 Quyidagi dasturlar o‘rnatiladi:"

for qator in "${izohli_dasturlar[@]}"; do
  echo -e "${YASHIL}  $qator${TIKLA}"
done

echo
read -p "❓ Davom etaylikmi? (y/n): " tasdiq
if [[ $tasdiq != "y" && $tasdiq != "Y" ]]; then
  ramka "⛔ O‘rnatish bekor qilindi"
  exit 0
fi

# === O‘RNATISHNI BOSHLASH ===
ramka "🚀 Dasturlarni o‘rnatish boshlandi..."

for pkg in "${paketlar[@]}"; do
  ramka "📥 O‘rnatilmoqda: $pkg"
  if pkg install -y "$pkg"; then
    echo -e "${YASHIL}✅ O‘rnatildi: $pkg${TIKLA}"
  else
    xato "O‘rnatishda xato: $pkg"
  fi
done

# === TAMOM ===
ramka "✅ Barcha dasturlar muvaffaqiyatli o‘rnatildi!"
