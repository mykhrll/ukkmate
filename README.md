<p align="center">
  <img src="assets/logo.jpeg" width="120" alt="UKKMate Logo" />
</p>

# UKKMate: Aplikasi Simulasi dan Bank Soal Uji Kompetensi Keahlian untuk Siswa SMK

> **Mobile Programming**  
> **Nama:** Muhamad Khoirul Ramadhan  
> **NPM:** 2413025012  
> **Program Studi:** Pendidikan Teknologi Informasi  
> **Versi Aplikasi:** v0.1.7 (Galeri Visual Mockup & Showcase UI Antarmuka)  
> **Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 📌 Ringkasan Aplikasi
**UKKMate** adalah aplikasi mobile berbasis Flutter yang dirancang khusus untuk mendampingi peserta didik Sekolah Menengah Kejuruan (SMK) dalam mempersiapkan dan menghadapi Uji Kompetensi Keahlian (UKK) berstandar BNSP dan LSP-P1. 

Aplikasi ini mengusung pendekatan **Offline-First**, memungkinkan siswa berlatih mengerjakan bank soal, membaca modul materi kejuruan, dan mengikuti simulasi CBT di lingkungan lab sekolah meskipun jaringan internet lab mengalami gangguan atau offline. Saat perangkat terhubung ke internet atau jaringan sekolah, data jawaban, nilai, dan rekap progres akan tersinkronisasi secara otomatis ke basis data cloud (**Firebase & Supabase**).

---

## 📱 Galeri Mockup & Tampilan Antarmuka (UI Showcase)

Berikut adalah dokumentasi tangkapan layar antarmuka pengguna (*user interface*) aplikasi **UKKMate** yang dirancang dengan estetika modern, konsistensi palet warna kejuruan, tipografi Google Fonts Inter, dan pengalaman pengguna (*user experience*) yang intuitif:

### 1. Autentikasi & Alur Masuk Pengguna
| Splash Screen Minimalis | Portal Login Terpadu (NISN & NIP) | Pendaftaran Akun Siswa Baru |
| :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Minimalist%20Splash%20Screen.png" width="225" alt="Splash Screen" /> | <img src="assets/UKKMate%20-%20Login%20Terpadu%20(NISN%20&%20NIP).png" width="225" alt="Login Terpadu" /> | <img src="assets/UKKMate%20-%20Daftar%20Akun%20Siswa%20Baru.png" width="225" alt="Daftar Akun Baru" /> |
| *Animasi Splash Screen & Branding* | *Pilihan Masuk Siswa/Guru & Google Auth* | *Registrasi dengan Konfirmasi Password* |

### 2. Dashboard Siswa & Sumber Pembelajaran Kejuruan
| Dashboard Utama Siswa | Modul & Bank Soal Kejuruan | Materi & Video Tutorial | Panduan & Kisi-kisi BNSP |
| :---: | :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Dashboard%20Utama%20Siswa.png" width="205" alt="Dashboard Utama Siswa" /> | <img src="assets/UKKMate%20-%20Bank%20Soal%20&%20Modul%20Kejuruan.png" width="205" alt="Bank Soal" /> | <img src="assets/UKKMate%20-%20Materi%20&%20Video%20Tutorial%20YouTube.png" width="205" alt="Video Tutorial" /> | <img src="assets/UKKMate%20-%20Panduan%20&%20Kisi-kisi%20UKK%20BNSP.png" width="205" alt="Kisi-kisi BNSP" /> |
| *Ringkasan Progres & Penanggalan WIB* | *Katalog Bank Soal Tiap Elemen* | *Integrasi Video Praktikum YouTube* | *Standar Kompetensi LSP-P1 SMK* |

### 3. Simulasi CBT, Latihan Mandiri & Evaluasi Nilai
| Latihan Soal & Pembahasan | Simulasi Ujian CBT | Hasil Ujian & Status Kompeten | Jadwal Agenda Simulasi |
| :---: | :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Latihan%20Soal%20&%20Pembahasan.png" width="205" alt="Latihan Soal" /> | <img src="assets/UKKMate%20-%20Simulasi%20Ujian%20CBT.png" width="205" alt="Simulasi CBT" /> | <img src="assets/UKKMate%20-%20Hasil%20Simulasi%20&%20Status%20Kompeten.png" width="205" alt="Hasil Simulasi" /> | <img src="assets/UKKMate%20-%20Jadwal%20&%20Agenda%20Simulasi%20UKK.png" width="205" alt="Jadwal Agenda" /> |
| *Latihan Soal dengan Pembahasan* | *Ujian CBT dengan Proteksi Anti-Cheat* | *Capaian Nilai & Rekomendasi* | *Kalender Agenda Pelaksanaan Ujian* |

### 4. Riwayat Progres, Profil & Arsitektur Offline-First
| Riwayat & Analitik Capaian | Profil Siswa & Validasi NISN | Pengaturan Akun & Sistem | Sinkronisasi Offline-First |
| :---: | :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Riwayat%20&%20Analitik%20Progres.png" width="205" alt="Riwayat & Analitik" /> | <img src="assets/UKKMate%20-%20Profil%20Pengguna%20&%20Validasi%20NISN.png" width="205" alt="Profil Pengguna" /> | <img src="assets/UKKMate%20-%20Pengaturan%20Akun%20&%20Sistem.png" width="205" alt="Pengaturan Akun" /> | <img src="assets/UKKMate%20-%20Status%20Sinkronisasi%20Offline-First.png" width="205" alt="Status Sinkronisasi" /> |
| *Statistik Skor & Riwayat Ujian* | *Biodata Siswa & Tutorial Ulang* | *Manajemen Keamanan & Preferensi* | *Antrean Sinkronisasi Cloud Supabase* |

### 5. Portal Khusus Guru Pendamping & Penguji
| Dashboard Guru Pendamping | Manajemen Kelas & Asesi | Distribusi Bank Soal Guru | Pengaturan Guru & Integrasi |
| :---: | :---: | :---: | :---: |
| <img src="assets/UKKMate%20-%20Dashboard%20Guru%20&%20Pantauan%20Siswa.png" width="205" alt="Dashboard Guru" /> | <img src="assets/UKKMate%20-%20Manajemen%20Kelas%20&%20Siswa%20Binaan%20Guru.png" width="205" alt="Manajemen Kelas" /> | <img src="assets/UKKMate%20-%20Kelola%20Bank%20Soal%20&%20Distribusi%20Ujian.png" width="205" alt="Kelola Bank Soal" /> | <img src="assets/UKKMate%20-%20Pengaturan%20Guru%20&%20Integrasi%20Lab.png" width="205" alt="Pengaturan Guru" /> |
| *Pantauan Keaktifan & Capaian Kelas* | *Verifikasi Asesi & Rombel Binaan* | *Manajemen Paket Ujian CBT* | *Status Koneksi Supabase & Keamanan* |

---

## 🚀 Fitur Utama (Pembaruan v0.1.5, v0.1.6 & v0.1.7)

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

11. **Galeri Dokumentasi Visual UI Mockup (v0.1.7):**
    - Integrasi lengkap 19 tangkapan layar mockup visual pada dokumentasi repositori GitHub (`README.md`).
    - Penyajian terstruktur mencakup seluruh alur: Autentikasi, Dashboard Siswa, Simulasi CBT, Hasil Penilaian, Riwayat Analitik, Profil Biodata, hingga Portal Guru Pendamping & Penguji Asesor.


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
