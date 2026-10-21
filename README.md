# UKKMate - Aplikasi Pendamping Uji Kompetensi Keahlian SMK

> **Mobile Programming**  
> **Nama:** Muhamad Khoirul Ramadhan  
> **NPM:** 2413025012  
> **Program Studi:** Pendidikan Teknologi Informasi  

---

## 📌 Ringkasan Aplikasi
**UKKMate** adalah prototipe aplikasi mobile berbasis Flutter yang dirancang khusus untuk mendampingi peserta didik Sekolah Menengah Kejuruan (SMK) dalam mempersiapkan dan menghadapi Uji Kompetensi Keahlian (UKK) berstandar BNSP. 

Aplikasi ini mengusung pendekatan **Offline-First**, memungkinkan siswa berlatih mengerjakan bank soal, membaca modul materi kejuruan, dan mengikuti simulasi CBT di lingkungan lab sekolah meskipun jaringan internet mengalami gangguan atau offline. Saat perangkat kembali terhubung ke jaringan sekolah atau internet, data jawaban dan rekap progres akan tersinkronisasi otomatis.

---

## 🚀 Fitur Utama

1. **Dashboard Siswa (Student Portal):**
   - Ringkasan target kompetensi UKK & countdown jadwal ujian kejuruan.
   - Status sinkronisasi offline (indikator ketersediaan bank soal lokal).
   - Akses cepat menuju tugas laboratorium dan modul materi.

2. **Latihan Mandiri & Simulasi CBT:**
   - Katalog paket soal per kompetensi keahlian (RPL, TKJ, dll.).
   - Sesi ujian CBT interaktif dengan timer, opsi ganda (A/B/C/D), dan diagram alur.
   - Fitur pembahasan kunci jawaban yang dapat disembunyikan (*collapsible explanation*).

3. **Status Sinkronisasi Offline-First:**
   - Visualisasi pemakaian penyimpanan lokal (Cache soal, SQLite DB, Aset panduan).
   - Antrean data pending sync dan riwayat log sinkronisasi berhasil.
   - Kontrol otomatisasi sinkronisasi saat tersambung ke jaringan lokal lab.

4. **Profil Siswa & Validasi NISN:**
   - Integrasi identitas terverifikasi Dapodik Kemendikbud.
   - Avatar foto profil default cerdas yang otomatis menyesuaikan jenis kelamin peserta didik.
   - Kartu identitas NISN terenkripsi untuk keamanan akses ujian.

5. **Portal Guru Pendamping (Teacher Portal):**
   - Dashboard pemantauan ujian langsung (*Live Exam Monitor*).
   - Analisis statistik siswa remedial vs siswa kompeten.
   - Manajemen asesi per rombongan belajar (Rombel XII RPL 1 & 2).

---

## 📸 Tangkapan Layar Antarmuka (Interface Screenshots)

| Splash & Login | Dashboard Siswa | Latihan Soal CBT |
| :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Minimalist%20Splash%20Screen.png" width="220" /> | <img src="assets/UKKMate%20-%20Dashboard%20Utama%20Siswa.png" width="220" /> | <img src="assets/UKKMate%20-%20Latihan%20Soal%20%26%20Pembahasan.png" width="220" /> |

| Profil & Validasi NISN | Status Sinkronisasi Offline | Portal Guru Pendamping |
| :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Profil%20Pengguna%20%26%20Validasi%20NISN.png" width="220" /> | <img src="assets/UKKMate%20-%20Status%20Sinkronisasi%20Offline-First.png" width="220" /> | <img src="assets/UKKMate%20-%20Dashboard%20Guru%20%26%20Pantauan%20Siswa.png" width="220" /> |

---

## 📂 Struktur Arsitektur Direktori

Proyek ini dibangun menggunakan arsitektur modular berbasis fitur (*feature-first*):

```text
lib/
├── core/                       # Komponen inti aplikasi
│   ├── theme/                  # Desain sistem & konstanta warna tema
│   │   ├── app_colors.dart     # Brand identity (Navy, Royal Blue, Green, Orange)
│   │   └── app_text_styles.dart# Standar tipografi Inter
│   └── widgets/                # Komponen UI global (Card, Button, Badge)
│
├── features/                   # Modul fitur fungsional
│   ├── auth/                   # Autentikasi NISN/NIP & Pendaftaran Akun
│   ├── home/                   # Beranda & Dashboard Siswa
│   ├── latihan/                # Paket soal & LatihanSoalScreen (CBT Session)
│   ├── materi/                 # Modul kejuruan & tutorial
│   ├── tugas/                  # Penugasan lab praktikum
│   ├── riwayat/                # Analitik progres nilai
│   ├── sinkronisasi/           # StatusSinkronisasiScreen (Offline engine)
│   ├── profile/                # ProfileScreen & ProfilSiswaScreen (Dapodik data)
│   └── guru/                   # GuruDashboardScreen & GuruDaftarAsesiScreen
│
└── main.dart                   # Entry point aplikasi & konfigurasi tema
```

---

## 🛠️ Langkah Menjalankan Proyek (Setup & Run)

### Prasyarat:
- Flutter SDK versi `^3.13.0` atau lebih baru
- Dart SDK versi `^3.1.0`
- Emulator Android / iOS atau perangkat fisik (Android 5.0 Lollipop / SDK 21+)
- VS Code atau Android Studio dengan plugin Flutter & Dart

### Langkah Instalasi:
1. **Clone repositori ini:**
   ```bash
   git clone https://github.com/mykhrll/ukkmate.git
   cd ukkmate
   ```

2. **Unduh dependencies paket:**
   ```bash
   flutter pub get
   ```

3. **Verifikasi kesehatan kode:**
   ```bash
   flutter analyze
   ```
   *(Pastikan status `No issues found!`)*

4. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

---

## 📄 Berkas Deklarasi AI
Sesuai dengan ketentuan integritas akademik UTS, dokumentasi transparansi penggunaan kecerdasan buatan, pembagian peran, dan studi kasus prompting dicatat secara lengkap pada berkas:
👉 **[AI_DECLARATION.md](AI_DECLARATION.md)**
