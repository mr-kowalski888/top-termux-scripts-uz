# 🚀 TOP Termux Scripts UZ — Termux uchun eng foydali skriptlar (Uzbek tilida)

Termux uchun kuchli, xavfsiz va chiroyli formatdagi bash skriptlar to‘plami.  
Yangilash, foydali utilitalarni o‘rnatish va tozalashni o‘z ichiga oladi — rus tilida yozilgan.

📁 Repozitoriy: [github.com/mr-kowalski888/top-termux-scripts-ru](https://github.com/mr-kowalski888/top-termux-scripts-ru)

---

## 📦 Nima bor?

### 🟢 `updg.sh` — Termux super yangilash
- Paketlar ro‘yxatini va o‘rnatilgan paketlarni yangilaydi (`pkg update && upgrade`)
- Keraksiz paketlarni o‘chiradi (`autoremove`)
- Kesh va vaqtinchalik fayllarni tozalaydi
- Internet aloqasi va disk bo‘sh joyini tekshiradi
- Rangli va ramkali chiroyli chiqish

### 🟩 `install.sh` — Foydali utilitalarni o‘rnatish
- 30+ eng kerakli utilitalarni o‘rnatadi: `curl`, `git`, `vim`, `figlet`, `lolcat`, `python`, `nmap`, va boshqalar
- O‘rnatishdan oldin tavsifli ro‘yxat ko‘rsatadi
- Foydalanuvchidan tasdiq so‘raydi
- Root kerak emas

### 🧹 `clean.sh` — Termux to‘liq tozalash
- APT kesh, vaqtincha fayllar, tarix va `.Trash` ni tozalaydi
- Foydalanuvchi fayllariga tegmaydi (xavfsiz)
- Tozalagandan so‘ng bo‘sh joyni ko‘rsatadi

---

## ⚙️ O‘rnatish va ishga tushurish

GitHub’dan yuklab olib, ruxsat berib, skriptlarni ishga tushiring:

```bash
# 📥 GitHub’dan repozitoriyani klon qilamiz
git clone https://github.com/mr-kowalski888/top-termux-scripts-ru

# 📂 Papkaga o‘tamiz
cd top-termux-scripts-ru

# ✅ Skriptlarga bajarish huquqi beramiz:
# - updg.sh     — yangilash
# - install.sh  — utilitalarni o‘rnatish
# - clean.sh    — tizimni tozalash
chmod +x updg.sh install.sh clean.sh

# ▶️ Kerakli skriptni ishga tushuramiz:
./updg.sh      # Yangilash
./install.sh   # Utilitalarni o‘rnatish
./clean.sh     # Termuxni tozalash
