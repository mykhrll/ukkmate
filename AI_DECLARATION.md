# DEKLARASI TRANSPARANSI PENGGUNAAN KECERDASAN BUATAN (AI_DECLARATION.md)

**Mata Kuliah:** Mobile Programming  
**Sifat Ujian:** Proyek Mandiri (Ujian Tengah Semester - UTS)  
**Nama Mahasiswa:** Muhamad Khoirul Ramadhan  
**NPM:** 2413025012  
**Program Studi:** Pendidikan Teknologi Informasi  
**Judul Aplikasi:** UKKMate: Aplikasi Simulasi dan Bank Soal Uji Kompetensi Keahlian untuk Siswa SMK  
**Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 1. Daftar Alat Kecerdasan Buatan (AI Tools)
Dalam pengembangan prototipe aplikasi UKKMate sejak awal pertemuan hingga pekan UTS, alat bantu AI yang digunakan adalah:
1. **GitHub Copilot (VS Code Extension):** Digunakan untuk autocompletion kode, pembuatan boilerplate layout widget Flutter, serta penulisan sintaks model data awal.
2. **Google Antigravity / Gemini:** Digunakan sebagai *collaborative coding partner* dalam mendesain antarmuka responsif sesuai mockup UI, analisis statis kode (*static analysis*), refactoring navigasi antarlayar, dan penegakan *clean code*.

---

## 2. Linimasa & Riwayat Progres Pengembangan Mingguan (5 Minggu Menuju UTS)

Progres pengerjaan aplikasi dibangun secara bertahap dan terencana per minggu sebagai berikut:

### 📅 Minggu 1: Inisiasi Proyek, Desain Sistem, & Autentikasi Terpadu
- **Fokus Utama:** Inisialisasi struktur proyek Flutter, konfigurasi dependensi (`pubspec.yaml`), dan pembuatan pondasi antarmuka.
- **Implementasi:**
  - Setup dependensi `google_fonts`, `percent_indicator`, dan `cupertino_icons`.
  - Pembuatan *Design System* awal: konstanta warna tema (`AppColors`), tipografi (`AppTextStyles`), dan custom widget dasar.
  - Implementasi **Minimalist Splash Screen** (`splash_screen.dart`) dengan integrasi logo aplikasi.
  - Implementasi **Login Terpadu** (`login_screen.dart`) untuk autentikasi NISN siswa dan NIP guru.
  - Implementasi **Pendaftaran Akun Baru** (`register_screen.dart`) lengkap dengan validasi form dan seleksi jenis kelamin.

### 📅 Minggu 2: Fitur Utama Siswa (Dashboard & Modul Pembelajaran)
- **Fokus Utama:** Menyediakan antarmuka utama pembelajaran mandiri bagi peserta didik kejuruan.
- **Implementasi:**
  - Implementasi **Dashboard Utama Siswa** (`home_screen.dart`) yang memuat target kompetensi keahlian, countdown jadwal simulasi UKK, dan ringkasan progres belajar.
  - Implementasi **Materi & Video Tutorial** (`materi_screen.dart`) yang mengelompokkan modul kejuruan (RPL, TKJ, dll.) serta integrasi tautan video pembelajaran YouTube.
  - Implementasi **Penugasan Lab** (`tugas_screen.dart`) untuk memantau tugas praktikum dan checklist kesiapan alat uji kompetensi.

### 📅 Minggu 3: Modul Evaluasi & Analitik Capaian (Bank Soal, Riwayat, & Bantuan)
- **Fokus Utama:** Modul evaluasi kemampuan siswa, pemantauan riwayat nilai, dan layanan bantuan.
- **Implementasi:**
  - Implementasi **Katalog Paket Latihan Soal** (`latihan_screen.dart`) dengan filter kompetensi (Mahir, Menengah, Dasar) dan status ketersediaan paket.
  - Implementasi **Riwayat & Analitik Progres** (`riwayat_screen.dart`) yang memuat grafik statistik nilai, riwayat pengerjaan simulasi CBT, dan status kelulusan standar kompetensi.
  - Implementasi **Pusat Bantuan & FAQ** (`bantuan_screen.dart`) serta halaman pengaturan akun pengguna (`profile_screen.dart`).

### 📅 Minggu 4: Penguatan Arsitektur Offline-First & Validasi Identitas Siswa
- **Fokus Utama:** Penyesuaian arsitektur aplikasi untuk kebutuhan lab sekolah yang minim internet dan akurasi data akademik.
- **Implementasi:**
  - Perancangan arsitektur *Offline-First caching* agar bank soal dan materi dapat diakses tanpa koneksi internet aktif.
  - Implementasi **Status Sinkronisasi Offline-First** (`status_sinkronisasi_screen.dart`) dengan visualisasi kapasitas memori lokal, antrean sinkronisasi, toggle auto-sync, dan riwayat sinkronisasi ke server sekolah.
  - Implementasi **Profil Pengguna & Validasi NISN** (`profil_siswa_screen.dart`) dengan data akademik Dapodik terenkripsi.
  - Pengalihan avatar default ke foto profil berbasis jenis kelamin (`pp_default_laki-laki.jpg` & `pp_default_perempuan.jpg`) menggantikan ikon logo generic.

### 📅 Minggu 5: Portal Guru Pendamping, Sesi CBT Interaktif, & Refinement UTS
- **Fokus Utama:** Monitoring asesi oleh guru pembimbing, sesi pengerjaan ujian interaktif, dan optimalisasi kode secara menyeluruh.
- **Implementasi:**
  - Implementasi **Latihan Mandiri RPL / Sesi CBT** (`latihan_soal_screen.dart`) dengan fitur pilihan ganda interaktif, diagram arsitektur sistem, toggle detail pembahasan jawaban, timer, dan navigasi nomor soal.
  - Implementasi **Portal Guru Pendamping - Dashboard** (`guru_dashboard_screen.dart`) memuat *Live Exam Monitor*, statistik siswa remedial vs kompeten, dan aksi cepat guru.
  - Implementasi **Portal Guru Pendamping - Daftar Asesi** (`guru_daftar_asesi_screen.dart`) untuk manajemen data asesi per rombel (XII RPL 1 & 2), filter kelulusan, dan sinkronisasi Dapodik.
  - Integrasi navigasi menyeluruh: tombol "Mulai Kerjakan" di Latihan langsung membuka sesi CBT, dan menu profil menyediakan pintasan ke Portal Guru, Profil Siswa, dan Sinkronisasi.
  - Penyelarasan warna latar aplikasi (`#EFF3FA`) agar selaras dengan palet logo UKKMate (navy & royal blue), menghilangkan kesan putih polos.
  - Audit kode dengan `flutter analyze` hingga mencapai **0 issues (Zero error, zero warning)**.
  - Penyusunan berkas kelengkapan UTS: `README.md` dan `AI_DECLARATION.md`.

---

## 3. Pembagian Peran (Human vs AI Contribution)

| Modul / Komponen | Peran Mahasiswa (Manual) | Peran Asisten AI |
| :--- | :--- | :--- |
| **Arsitektur Proyek & Folder Structure** | Menentukan arsitektur berbasis fitur (*feature-first* / layered architecture: `core`, `features`, `widgets`), memilih package dependency. | Merekomendasikan struktur hirarki file standar Flutter. |
| **Desain Sistem & Brand Identity** | Menentukan palet warna dari logo utama (`#161A29`, `#135CE2`, `#23B26D`, `#F99E15`), menolak latar putih polos dan meminta latar *soft slate-blue* (`#EFF3FA`). | Mengenerate kelas konstanta warna (`AppColors`) dan `AppTextStyles`. |
| **Latihan Mandiri & Simulasi CBT** | Merancang logika interaktif seleksi opsi jawaban (A/B/C/D), alur navigasi soal, dan mekanisme toggle penjelasan jawaban. | Membantu penyusunan widget visual soal, opsi radio card, dan progress bar timer. |
| **Portal Guru & Pantauan Siswa** | Menentukan kebutuhan data pantauan (status kompeten, indikator remedial, Live Monitor ujian, dan sinkronisasi Dapodik). | Menghasilkan struktur card analitik dan listview asesi. |
| **Validasi & Foto Profil Berbasis Gender** | Mengarahkan integrasi aset foto profil default sesuai jenis kelamin (`pp_default_laki-laki.jpg` & `pp_default_perempuan.jpg`) menggantikan placeholder icon/logo. | Menyesuaikan binding `AssetImage` pada `CircleAvatar`. |
| **Debugging & Quality Assurance** | Menguji fungsionalitas, mengevaluasi lint issue dengan `flutter analyze`, serta memastikan zero error & zero warning. | Memberikan saran perbaikan konstanta (`const`) dan pembersihan *unused fields*. |

---

## 4. Studi Kasus Prompting & Evaluasi Kritis

### Studi Kasus 1: Penanganan Ketiadaan `BuildContext` pada Navigasi `StatelessWidget`
- **Tujuan / Instruksi (Prompt):**  
  *"Hubungkan tombol pengaturan di ProfileScreen menuju halaman ProfilSiswaScreen dan StatusSinkronisasiScreen yang baru dibuat."*
- **Keluaran Awal AI (Galat Terdeteksi):**  
  AI membuat helper method `Widget _buildSettingsCard()` tanpa menyertakan parameter `BuildContext context`. Di dalam method tersebut, AI memanggil `Navigator.push(context, ...)`. Karena `ProfileScreen` merupakan `StatelessWidget`, pemanggilan `context` tersebut menghasilkan error kompilasi *undefined name 'context'*.
- **Tindakan & Penyesuaian Manual Mahasiswa:**  
  1. Mendeteksi bahwa pada `StatelessWidget`, `BuildContext` hanya dapat diakses melalui parameter method `build(BuildContext context)`.
  2. Melakukan refactoring dengan menambahkan parameter `BuildContext context` pada definisi `_buildSettingsCard(BuildContext context)`.
  3. Memperbarui titik pemanggilan di dalam `build()` menjadi `_buildSettingsCard(context)` sehingga navigasi berjalan stabil tanpa crash.

---

### Studi Kasus 2: Penyelarasan Warna Latar Belakang & Mapping Aset Profil
- **Tujuan / Instruksi (Prompt):**  
  *"Latar aplikasi jangan putih polos gitu, sesuaikan dengan warna pada logo aplikasi supaya terlihat berwarna dan user-friendly. Perbaiki juga foto profil default agar menggunakan foto yang sudah disiapkan sesuai jenis kelamin, bukan icon logo."*
- **Keluaran Awal AI (Galat Terdeteksi):**  
  AI awalnya menggunakan `Color(0xFFF9FAFF)` (hampir 100% putih) sehingga kartu putih di atasnya tidak memiliki kontras dan terlihat monoton. Selain itu, pada beberapa layar AI sempat salah mereferensikan file logo menjadi `assets/logo.png` (padahal file fisik berformat `assets/logo.jpeg`) dan masih menggunakan icon placeholder.
- **Tindakan & Penyesuaian Manual Mahasiswa:**  
  1. Menyesuaikan `AppColors.backgroundLight` menjadi `Color(0xFFEFF3FA)` yang mengambil nuansa biru-abu sejuk selaras dengan logo navy dan royal blue UKKMate.
  2. Memperbaiki seluruh pemanggilan ekstensi gambar logo menjadi `assets/logo.jpeg`.
  3. Mengganti icon placeholder pada widget profil dengan aset `assets/pp_default_laki-laki.jpg` dan `assets/pp_default_perempuan.jpg`.

---

## 5. Rencana Target Fitur Menuju Akhir Semester (UAS)
1. **Integrasi Backend API (RESTful API):** Menghubungkan modul autentikasi NISN/NIP, pengambilan bank soal, dan pengiriman rekap nilai ke server database terpusat.
2. **Penyimpanan Lokal Persisten (SQLite / Isar / Drift):** Menyempurnakan fitur *Offline-First* agar seluruh riwayat pengerjaan soal dan cache paket materi tersimpan permanen di perangkat lokal mahasiswa saat tidak ada sinyal.
3. **Fitur Presensi / Validasi QR Code CBT Lab:** Menambahkan scanner kamera untuk memindai kode QR workstation lab komputer saat ujian simulasi UKK berlangsung.
