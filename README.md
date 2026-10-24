# UKKMate: Aplikasi Simulasi dan Bank Soal Uji Kompetensi Keahlian untuk Siswa SMK

> **Mobile Programming**  
> **Nama:** Muhamad Khoirul Ramadhan  
> **NPM:** 2413025012  
> **Program Studi:** Pendidikan Teknologi Informasi  
> **Versi Aplikasi:** v0.1.6 (Perbaikan Build & Optimasi Android Release)  
> **Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 📌 Ringkasan Aplikasi
**UKKMate** adalah aplikasi mobile berbasis Flutter yang dirancang khusus untuk mendampingi peserta didik Sekolah Menengah Kejuruan (SMK) dalam mempersiapkan dan menghadapi Uji Kompetensi Keahlian (UKK) berstandar BNSP dan LSP-P1. 

Aplikasi ini mengusung pendekatan **Offline-First**, memungkinkan siswa berlatih mengerjakan bank soal, membaca modul materi kejuruan, dan mengikuti simulasi CBT di lingkungan lab sekolah meskipun jaringan internet lab mengalami gangguan atau offline. Saat perangkat terhubung ke internet atau jaringan sekolah, data jawaban, nilai, dan rekap progres akan tersinkronisasi secara otomatis ke basis data cloud (**Firebase & Supabase**).

---

## 🚀 Fitur Utama (Pembaruan v0.1.5 & v0.1.6)

1. **Video Splash Screen Interaktif (3–5 Detik):**
   - Menampilkan animasi video splash screen beresolusi tinggi (`assets/splash-screen.mp4`).
   - Durasi pemutaran otomatis dibatasi 3.8 detik (menyesuaikan performa dan spesifikasi perangkat).
   - Dilengkapi tombol interaktif **"Lewati"** dengan indikator *countdown timer* di pojok kanan atas serta *graceful fallback* logo animasi untuk perangkat berspesifikasi rendah.

2. **Panduan & Tutorial Aplikasi (Onboarding Walkthrough):**
   - Ditampilkan otomatis saat pertama kali pengguna menginstal dan membuka aplikasi (tersimpan via `SharedPreferences`).
   - Panduan visual 4 langkah: Pengenalan UKKMate, Simulasi CBT Digital, Asisten AI Pintar, dan Portal Guru Pendamping.
   - Dapat diakses kembali sewaktu-waktu melalui menu pengaturan profil siswa maupun pengaturan guru.

3. **Keamanan & Autentikasi Pengguna:**
   - **Konfirmasi Kata Sandi (2x Input):** Form pendaftaran siswa baru mewajibkan konfirmasi kata sandi dengan validasi kecocokan karakter secara *real-time* dan syarat minimal 8 karakter.
   - **Autentikasi Akun Google:** Tombol *Masuk dengan Google* dan *Daftar dengan Google* pada antarmuka login terpadu dengan alur pemilihan akun Google yang siap dihubungkan ke Firebase Auth / Supabase OAuth.
   - **Lupa Kata Sandi Interaktif:** Pengguna dapat menekan tautan *Lupa Kata Sandi?* untuk mengirimkan tautan reset kata sandi langsung ke email terdaftar Dapodik.

4. **Portal Guru Pendamping (Teacher Portal) Terarah:**
   - Saat masuk ke akun Guru Pendamping, aplikasi secara default langsung membuka menu **Kelas** (`initialIndex: 0` - `GuruDaftarAsesiScreen`) agar guru dapat langsung memverifikasi peserta dan rombel binaan.
   - Deteksi otomatis peran pengguna berdasarkan 18 digit NIP resmi.

5. **Pengaturan Guru Lengkap (Teacher Settings):**
   - Kartu profil guru berstatus asesor terverifikasi.
   - Kartu status sinkronisasi database cloud (Supabase Database & Firebase Messaging).
   - Pengaturan ujian CBT: Acak urutan butir soal, acak opsi pilihan jawaban (A–E), dan kontrol deteksi anti-kecurangan (*anti-cheat screen exit*).
   - Dialog konfirmasi keluar akun yang aman.

6. **UKKMate AI Assistant (Chat Bot Interaktif):**
   - Tombol melayang (`FloatingChatButton`) kini langsung membuka halaman percakapan interaktif **UKKMate AI Assistant** (`ChatBotScreen`).
   - Dilengkapi *quick prompts* seputar kisi-kisi UKK RPL, query database SQL, strategi manajemen waktu CBT, dan petunjuk sinkronisasi Dapodik.
   - Fitur salin teks jawaban, indikator status bot *Online*, dan animasi pengetikan respons AI.

7. **Penanggalan Dinamis & Waktu Nyata (WIB):**
   - Menghilangkan tahun hardcoded (seperti 2024), digantikan dengan penanggalan dinamis berbasis waktu lokal HP (WIB).
   - Tahun ajaran akademik dihitung otomatis (misal `2026/2027`).
   - Banner beranda menampilkan tanggal lengkap bahasa Indonesia (contoh: *Sabtu, 24 Oktober 2026 • WIB*).

8. **Pembersihan Data Demo & Kesiapan Backend Database:**
   - Menghapus badge statis yang tidak sesuai kebutuhan (seperti banner Pusdatin/BNSP non-fungsional).
   - Dibuat kelas arsitektur `BackendConfig` sebagai jembatan kontrak API untuk integrasi live database **Supabase** dan **Firebase**.

9. **Keamanan Ujian CBT:**
   - Pencegahan tangkapan layar (*anti-screenshot*) dan perekaman layar via platform channel `FLAG_SECURE`.
   - Pencegahan seleksi teks dan penyalinan soal (*anti-copy*) melalui `SelectionContainer.disabled`.

10. **Optimasi Kompilasi Android Release (v0.1.6):**
    - Konfigurasi Gradle Android diperbarui dengan `kotlin.incremental=false` pada `gradle.properties` untuk mencegah kendala *file locking incremental cache* pada sistem operasi Windows.
    - Penyesuaian batas minimum SDK Android menjadi `minSdk = 21` pada `build.gradle.kts` demi kompatibilitas stabil modul pemutar video.
    - Seluruh proses kompilasi `flutter build apk --release` terverifikasi sukses 100% menghasilkan `app-release.apk` (54.2 MB).

---

## 📂 Struktur Arsitektur Direktori

Proyek ini dibangun menggunakan arsitektur modular berbasis fitur (*feature-first*) yang bersih dan mudah dikembangkan:

```text
lib/
├── core/                                 # Komponen inti & pondasi aplikasi
│   ├── services/
│   │   └── backend_config.dart           # Jembatan konfigurasi & integrasi Supabase & Firebase
│   ├── theme/
│   │   ├── app_colors.dart               # Brand identity (Navy, Royal Blue, Green, Orange)
│   │   └── app_text_styles.dart          # Standar tipografi Google Fonts Inter
│   ├── utils/
│   │   └── date_formatter.dart           # Format tanggal dinamis bahasa Indonesia & zona waktu WIB
│   └── widgets/                          # Komponen UI global (CustomCard, StatusBadge, FloatingChatButton)
│
├── features/                             # Modul fitur fungsional
│   ├── auth/                             # Login terpadu, konfirmasi pendaftaran, & Google Auth
│   ├── onboarding/                       # Panduan petunjuk & tutorial interaktif pengguna baru
│   ├── chatbot/                          # Layar percakapan interaktif AI Assistant UKKMate
│   ├── home/                             # Beranda & Dashboard Siswa (dengan penanggalan dinamis)
│   ├── exam/                             # Sesi ujian CBT & hasil ujian (dengan keamanan layar)
│   ├── latihan/                          # Katalog bank soal & latihan mandiri
│   ├── materi/                           # Modul kejuruan & materi video YouTube
│   ├── tugas/                            # Penugasan praktikum laboratorium
│   ├── riwayat/                          # Riwayat ujian & analitik capaian kompetensi
│   ├── sinkronisasi/                     # Mesin Offline-First & antrean sinkronisasi
│   ├── profile/                          # Profil siswa, edit biodata, & tutorial aplikasi
│   ├── navigation/                       # MainNavigation (Bottom Nav Shell siswa)
│   ├── splash/                           # Video Splash Screen (assets/splash-screen.mp4)
│   └── guru/                             # Portal Guru: Kelas (DaftarAsesi), BankSoal, Dashboard, Pengaturan
│
└── main.dart                             # Entry point aplikasi & konfigurasi tema
```

---

## 🛠️ Langkah Menjalankan Proyek (Setup & Run)

### Prasyarat:
- Flutter SDK versi `^3.13.0` atau lebih baru (teruji stabil pada Flutter 3.47.1)
- Dart SDK versi `^3.13.0`
- Emulator Android / iOS atau perangkat fisik (Android 5.0 Lollipop / SDK 21+)
- VS Code atau Android Studio dengan ekstensi Flutter & Dart

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

3. **Verifikasi kesehatan kode & pengujian:**
   ```bash
   flutter analyze
   flutter test
   ```
   *(Pastikan status `No issues found!` dan seluruh test lulus)*

4. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

---

## 📄 Berkas Deklarasi AI
Dokumentasi transparansi penggunaan kecerdasan buatan, pembagian peran, linimasa mingguan, studi kasus perbaikan, dan kepatuhan integritas akademik dicatat secara lengkap pada berkas:
👉 **[AI_DECLARATION.md](AI_DECLARATION.md)**
