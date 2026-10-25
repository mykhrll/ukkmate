# DEKLARASI TRANSPARANSI PENGGUNAAN KECERDASAN BUATAN (AI_DECLARATION.md)

**Mata Kuliah:** Mobile Programming  
**Sifat Ujian / Tugas:** Proyek Mandiri (Pengembangan Berkelanjutan Menuju UAS)  
**Nama Mahasiswa:** Muhamad Khoirul Ramadhan  
**NPM:** 2413025012  
**Program Studi:** Pendidikan Teknologi Informasi  
**Judul Aplikasi:** UKKMate: Aplikasi Simulasi dan Bank Soal Uji Kompetensi Keahlian untuk Siswa SMK  
**Versi Saat Ini:** v0.1.6 (Perbaikan Gradle & Kompilasi APK Release)  
**Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 1. Daftar Alat Kecerdasan Buatan (AI Tools)
Dalam pengembangan aplikasi UKKMate mulai dari inisiasi, UTS, hingga Progres 5, alat bantu AI yang digunakan adalah:
1. **GitHub Copilot (VS Code Extension):** Digunakan untuk autocompletion kode, pembuatan boilerplate layout widget Flutter, serta penulisan sintaks model data awal.
2. **Google Antigravity / Gemini 3.8 Flash (High):** Digunakan sebagai *collaborative coding partner* dalam arsitektur perangkat lunak, perancangan antarmuka responsif sesuai kebutuhan pengguna, perbaikan galat lint (*static analysis*), integrasi alur autentikasi, dan otomatisasi deployment repositori Git.

---

## 2. Linimasa, Versi Rilis, & Riwayat Progres Pengembangan

Pengerjaan dan rilis versi aplikasi UKKMate dibangun secara bertahap dan terencana dengan penomoran versi berkala:

| Versi Rilis | Periode | Fokus Pengembangan Utama |
| :--- | :--- | :--- |
| **v0.0.1** | Minggu 1 – 2 | Inisiasi proyek Flutter, *design system*, autentikasi NISN/NIP, modul materi, tugas lab, dan dashboard siswa. |
| **v0.0.3** | Minggu 3 – 4 | Katalog bank soal bertingkat, riwayat & analitik capaian kompetensi, arsitektur *Offline-First caching*, serta validasi profil Dapodik. |
| **v0.0.5** | Minggu 5 | Sesi ujian CBT interaktif (`LatihanSoalScreen`), Portal Guru Pendamping (Dashboard & Daftar Asesi), penyelarasan warna tema logo, dan finalisasi berkas UTS. |
| **v0.1.0 (UTS)** | Minggu 6 | Smooth navigation guru, floating AI chatbot scaffolding, keamanan ujian (anti-screenshot & anti-copy), Bank Soal guru, dan penyempurnaan UI. |
| **v0.1.5 (Progres 5)** | Pasca-UTS | Video splash screen (3-5s), tutorial pengguna baru (onboarding walkthrough), konfirmasi kata sandi pendaftaran, login/daftar akun Google, fitur lupa kata sandi via email, direct access tab Kelas untuk guru, UI Pengaturan Guru lengkap, implementasi UI interaktif Chat Bot AI, pembersihan data demo, dan penyesuaian tanggal dinamis (WIB). |
| **v0.1.6** | Pasca-UTS | Perbaikan kegagalan build APK di Windows (`kotlin.incremental=false`), penghentian daemon pengunci file, konfigurasi `minSdk 21`, dan optimasi kompilasi `assembleRelease`. |
| **v0.1.7** | Pasca-UTS | Integrasi galeri visual 19 mockup UI aplikasi ke `README.md`, penambahan logo header terpusat, pengelompokan alur antarmuka komprehensif, dan sinkronisasi versi aplikasi. |
| **v0.1.8** | Minggu 6 | Penyempurnaan video splash screen murni sinematik: penghapusan kedipan splash screen lama (fallback UI), penghapusan tombol lewati & overlay branding footer, serta inisiasi progres Minggu ke 6. |
| **v0.1.9** | Minggu 6 | Dukungan debugging web browser Google Chrome: inisialisasi timer independen anti-stuck, penyesuaian Chrome Autoplay Policy (`volume 0`), CSS styling background di `index.html`, isolasi platform channel web, dan frame preview responsif (`maxWidth: 480`). |




---

### 📅 Minggu 1 – 2 (Rilis v0.0.1): Inisiasi Proyek, Desain Sistem, & Fitur Siswa
- **Fokus Utama:** Inisialisasi struktur proyek Flutter, konfigurasi dependensi (`pubspec.yaml`), dan pembuatan pondasi antarmuka siswa.
- **Implementasi:**
  - Setup dependensi `google_fonts`, `percent_indicator`, dan `cupertino_icons`.
  - Pembuatan *Design System* awal: konstanta warna tema (`AppColors`), tipografi (`AppTextStyles`), dan custom widget dasar.
  - Implementasi **Minimalist Splash Screen** (`splash_screen.dart`) dengan integrasi logo aplikasi.
  - Implementasi **Login Terpadu** (`login_screen.dart`) untuk autentikasi NISN siswa dan NIP guru.
  - Implementasi **Pendaftaran Akun Baru** (`register_screen.dart`) lengkap dengan validasi form dan seleksi jenis kelamin.
  - Implementasi **Dashboard Utama Siswa** (`home_screen.dart`) yang memuat target kompetensi keahlian, countdown jadwal simulasi UKK, dan ringkasan progres belajar.
  - Implementasi **Materi & Video Tutorial** (`materi_screen.dart`) yang mengelompokkan modul kejuruan serta integrasi tautan video pembelajaran YouTube.
  - Implementasi **Penugasan Lab** (`tugas_screen.dart`) untuk memantau tugas praktikum dan checklist kesiapan alat uji kompetensi.

### 📅 Minggu 3 – 4 (Rilis v0.0.3): Evaluasi Mandiri, Analitik, & Arsitektur Offline-First
- **Fokus Utama:** Modul evaluasi kemampuan siswa, pemantauan riwayat nilai, serta perancangan arsitektur *Offline-First* dan sinkronisasi Dapodik.
- **Implementasi:**
  - Implementasi **Katalog Paket Latihan Soal** (`latihan_screen.dart`) dengan filter kompetensi (Mahir, Menengah, Dasar) dan status ketersediaan paket.
  - Implementasi **Riwayat & Analitik Progres** (`riwayat_screen.dart`) yang memuat grafik statistik nilai, riwayat pengerjaan simulasi CBT, dan status kelulusan standar kompetensi.
  - Implementasi **Pusat Bantuan & FAQ** (`bantuan_screen.dart`) serta halaman pengaturan akun pengguna (`profile_screen.dart`).
  - Perancangan arsitektur *Offline-First caching* agar bank soal dan materi dapat diakses tanpa koneksi internet aktif di lab sekolah.
  - Implementasi **Status Sinkronisasi Offline-First** (`status_sinkronisasi_screen.dart`) dengan visualisasi kapasitas memori lokal, antrean sinkronisasi, toggle auto-sync, dan riwayat sinkronisasi ke server sekolah.
  - Implementasi **Profil Pengguna & Validasi NISN** (`profil_siswa_screen.dart`) dengan data akademik Dapodik terenkripsi.
  - Pengalihan avatar default ke foto profil berbasis jenis kelamin (`pp_default_laki-laki.jpg` & `pp_default_perempuan.jpg`) menggantikan ikon generic.

### 📅 Minggu 5 (Rilis v0.0.5): Portal Guru Pendamping, Sesi CBT Interaktif, & Finalisasi Awal
- **Fokus Utama:** Monitoring asesi oleh guru pembimbing, sesi pengerjaan ujian interaktif, penyesuaian tema warna logo, dan kepatuhan standar UTS.
- **Implementasi:**
  - Peningkatan versi aplikasi di `pubspec.yaml` dan tampilan profil menjadi **v0.0.5**.
  - Implementasi **Latihan Mandiri RPL / Sesi CBT** (`latihan_soal_screen.dart`) dengan fitur pilihan ganda interaktif, diagram arsitektur sistem, toggle detail pembahasan jawaban, timer, dan navigasi nomor soal.
  - Implementasi **Portal Guru Pendamping - Dashboard** (`guru_dashboard_screen.dart`) memuat *Live Exam Monitor*, statistik siswa remedial vs kompeten, dan aksi cepat guru.
  - Implementasi **Portal Guru Pendamping - Daftar Asesi** (`guru_daftar_asesi_screen.dart`) untuk manajemen data asesi per rombel (XII RPL 1 & 2), filter kelulusan, dan sinkronisasi Dapodik.
  - Integrasi navigasi menyeluruh: tombol "Mulai Kerjakan" di Latihan langsung membuka sesi CBT, dan menu profil menyediakan pintasan ke Portal Guru, Profil Siswa, dan Sinkronisasi.
  - Penyelarasan warna latar aplikasi (`#EFF3FA`) agar selaras dengan palet logo UKKMate (navy & royal blue), menghilangkan kesan putih polos.
  - Audit kode dengan `flutter analyze` hingga mencapai **0 issues (Zero error, zero warning)**.

### 📅 Minggu 6 (Rilis v0.1.0 — Versi UTS Final): Smooth Navigation, AI Chatbot, & Keamanan Ujian
- **Fokus Utama:** Penyempurnaan UX navigasi guru, penambahan fitur AI chatbot scaffolding, implementasi keamanan ujian, dan penyelarasan UI dengan mockup Figma.
- **Implementasi:**
  - Peningkatan versi aplikasi menjadi **v0.1.0** di `pubspec.yaml`, splash screen, dan profil.
  - Implementasi **Smooth Login/Register** (`login_screen.dart`) — unified screen dengan `AnimatedCrossFade` dan animated indicator pill.
  - Penggantian logo placeholder ke logo resmi UKKMate (`assets/logo.jpeg`) di seluruh header siswa dan guru.
  - Penambahan tombol kembali (`arrow_back`) pada seluruh sub-menu yang tidak ada di bottom navigation bar.
  - Implementasi **GuruNavigation** (`guru_navigation.dart`) — shell navigasi terpusat untuk portal guru dengan transisi `AnimatedSwitcher` (fade smooth).
  - Implementasi **Floating AI Chatbot Button** (`floating_chat_button.dart`) dengan auto-hide saat sesi ujian aktif.
  - **Keamanan Ujian:** Pencegahan tangkapan layar (`FLAG_SECURE`) via platform channel (`MainActivity.kt`) dan pencegahan penyalinan teks soal (`SelectionContainer.disabled`).
  - Implementasi **Bank Soal Guru** (`guru_bank_soal_screen.dart`) untuk manajemen paket soal, distribusi lab, rubrik penilaian, dan konfigurasi timer.

### 📅 Pasca-UTS / Progres 5 (Rilis v0.1.5): Video Splash, Tutorial Onboarding, Autentikasi Google, AI Chat Bot, & Pembersihan Data Demo
- **Fokus Utama:** Transisi dari demo statis menuju kesiapan backend database (Firebase & Supabase), onboarding tutorial pengguna baru, konfirmasi kata sandi ganda, autentikasi Google, perombakan splash screen video, serta realisasi antarmuka AI Chatbot dan Pengaturan Guru.
- **Implementasi:**
  - **Video Splash Screen (`splash_screen.dart`):** Mengintegrasikan video resmi `assets/splash-screen.mp4` menggunakan paket `video_player`. Durasi dibatasi 3.8 detik (sesuai spesifikasi perangkat 3–5 detik) dengan tombol *Lewati* dan hitungan mundur.
  - **Tutorial / Petunjuk Pengguna Baru (`onboarding_tutorial_screen.dart`):** Implementasi walkthrough 4 tahap pengenalan fitur utama aplikasi bagi pengguna yang baru pertama kali menginstal (tersimpan di `SharedPreferences`). Dapat dibuka kembali kapan saja via Profil atau Pengaturan Guru.
  - **Konfirmasi Kata Sandi (2x Input):** Form registrasi akun siswa menambahkan input *Konfirmasi Kata Sandi* dengan indikator kecocokan langsung (*match indicator*) dan validasi minimal 8 karakter.
  - **Autentikasi Akun Google:** Tombol *Masuk dengan Google* dan *Daftar dengan Google* pada form login dan register, siap untuk integrasi Google Sign-In Supabase / Firebase.
  - **Lupa Kata Sandi Interaktif:** Tautan *Lupa Kata Sandi?* kini aktif dan membuka modal bottom sheet untuk pengiriman tautan reset ke email terdaftar Dapodik.
  - **Akses Langsung Menu Kelas Guru:** Alur masuk akun guru dialihkan langsung ke tab **Kelas** (`GuruDaftarAsesiScreen`, index 0), memudahkan guru memantau siswa asesi secara cepat.
  - **Desain Pengaturan Guru (`guru_pengaturan_screen.dart`):** Menggantikan placeholder dengan modul pengaturan lengkap: profil asesor, status sinkronisasi Supabase & Firebase, konfigurasi ujian CBT (acak soal, acak jawaban, anti-curang), dan opsi logout aman.
  - **Tampilan Chat Bot Interaktif (`chatbot_screen.dart`):** Menggantikan bottom sheet "Coming Soon" menjadi layar percakapan interaktif AI Assistant lengkap dengan *quick prompts* kisi-kisi UKK RPL, query SQL, manajemen waktu CBT, dan petunjuk sinkronisasi.
  - **Penanggalan Dinamis & Waktu Nyata (WIB):** Dibuat utility `DateFormatter` untuk menampilkan tanggal lokal berjalan (WIB) dan tahun ajaran dinamis (misal `2026/2027`), menggantikan tahun statis 2024.
  - **Pembersihan Data Demo & Arsitektur Backend:** Menghapus badge statis Pusdatin/BNSP non-fungsional dan membuat `BackendConfig` sebagai jembatan kesiapan API Firebase & Supabase.
  - **Otomatisasi Git & Versioning:** Disimpan aturan kerja otomatisasi commit dan kenaikan versi di `.agents/rules/auto_commit_and_version.md`.

### 📅 Pembaruan Pasca-UTS (Rilis v0.1.6): Perbaikan Kompilasi APK Release & Penyesuaian Gradle Windows
- **Fokus Utama:** Mengatasi galat build APK Android (`assembleRelease` / `assembleDebug`) di Windows akibat penguncian file incremental cache Kotlin serta memastikan kompatibilitas `minSdkVersion`.
- **Implementasi:**
  - Penambahan parameter `kotlin.incremental=false` pada `android/gradle.properties` untuk menonaktifkan cache inkremental Kotlin yang sering mengalami *file locking* di sistem operasi Windows.
  - Penyesuaian batas minimum SDK menjadi `minSdk = flutter.minSdkVersion.coerceAtLeast(21)` pada `android/app/build.gradle.kts` demi kompatibilitas penuh decoder pemutar video `video_player_android`.
  - Pembersihan cache lama (`flutter clean`) dan terminasi Gradle daemon yang aktif di memori (`gradlew --stop`).
  - Verifikasi build APK rilis berhasil 100% menghasilkan `app-release.apk` (54.2 MB) siap pasang.
  - Formalisasi aturan otomatisasi perbaruan dokumentasi (`README.md` dan `AI_DECLARATION.md`) di `.agents/rules/auto_commit_and_version.md`.

### 📅 Pembaruan Pasca-UTS (Rilis v0.1.7): Integrasi Galeri Mockup Visual & Dokumentasi Komprehensif
- **Fokus Utama:** Menampilkan seluruh aset rancangan visual antarmuka (mockup) aplikasi UKKMate secara rapi, profesional, dan terstruktur pada dokumentasi repositori GitHub (`README.md`).
- **Implementasi:**
  - Penambahan banner identitas visual logo aplikasi `assets/logo.jpeg` di bagian header `README.md`.
  - Pembuatan galeri visual UI showcase berbasis tabel Markdown/HTML yang terbagi ke dalam 5 bagian alur pengguna:
    1. *Autentikasi & Masuk Akun* (Splash Screen, Login Terpadu NISN/NIP, Registrasi Akun Baru).
    2. *Dashboard Siswa & Pembelajaran Kejuruan* (Dashboard Utama, Modul Bank Soal, Materi Video YouTube, Kisi-kisi BNSP).
    3. *Simulasi CBT, Latihan & Evaluasi* (Latihan Soal & Pembahasan, Simulasi CBT, Hasil Penilaian & Status Kompeten, Jadwal Agenda).
    4. *Riwayat, Profil & Arsitektur Offline-First* (Riwayat & Analitik, Profil Validasi NISN, Pengaturan Sistem, Status Sinkronisasi).
    5. *Portal Khusus Guru Pendamping & Penguji* (Dashboard Guru, Manajemen Kelas Binaan, Distribusi Bank Soal, Pengaturan Guru).
  - Sinkronisasi nomor versi aplikasi menjadi `v0.1.7` di seluruh titik antarmuka (`pubspec.yaml`, `profile_screen.dart`, dan `guru_pengaturan_screen.dart`).

### 📅 Progres Minggu ke 6 (Rilis v0.1.8): Penyempurnaan Video Splash Screen Murni & Sinematik
- **Fokus Utama:** Menghilangkan residu UI splash screen lama dan overlay yang mengganggu pengalaman visual pembuka aplikasi, sehingga video splash screen tampil 100% murni, bersih, dan sinematik.
- **Implementasi:**
  - Menghapus komponen fallback UI splash screen lama (`_buildFallbackSplash()`) yang sebelumnya sempat muncul sepersekian detik sebelum inisialisasi video selesai (menghapus kotak logo lama, linear loader, dan teks 'Memuat UKKMate...').
  - Menghilangkan tombol lewati (*skip countdown button*) `Lewati (x) >` di pojok kanan atas beserta timer hitung mundurnya.
  - Menghapus teks branding footer `UKKMate • Standar Asesmen Kejuruan SMK` di bagian bawah layar.
  - Menetapkan warna latar belakang layar menjadi `#0F1523` yang identik dengan tema video splash sehingga transisi antar-frame berjalan mulus tanpa kedipan.
  - Menyesuaikan berkas pengujian `test/widget_test.dart` dan menyinkronkan nomor versi ke `v0.1.8`.

### 📅 Progres Minggu ke 6 (Rilis v0.1.9): Dukungan Debug Web Chrome & Kompatibilitas Antar-Platform
- **Fokus Utama:** Memperbaiki galat saat proses debug dijalankan pada browser Google Chrome (`flutter run -d chrome`), di mana aplikasi sebelumnya *stuck* pada splash screen dan layar terbelah putih di sebelah kanan.
- **Implementasi:**
  - **Inisialisasi Timer Navigasi Independen:** Memindahkan inisialisasi `_navigationTimer` ke dalam `initState()` agar tidak terikat dengan status *completion* dari `VideoPlayerController.initialize()`. Dengan demikian, navigasi ke halaman login/onboarding dijamin 100% selalu berjalan lancar dan tidak pernah *freeze*.
  - **Penyesuaian Autoplay Policy Browser:** Mengatur `await _controller!.setVolume(0.0)` khusus pada platform web (`kIsWeb`) sehingga Chrome tidak memblokir pemutaran video otomatis tanpa interaksi fisik pengguna.
  - **Penanganan Batas Waktu (*Timeout*):** Menambahkan pembatas waktu `.timeout(const Duration(seconds: 2))` pada inisialisasi video controller untuk mencegah Future menggantung di lingkungan sandbox web.
  - **Perbaikan CSS Background Web:** Menambahkan styling `background-color: #0F1523; width: 100%; height: 100%;` pada `web/index.html` untuk mengeliminasi area putih kosong di sebelah kanan canvas.
  - **Frame Responsif Mobile-Optimized:** Menambahkan wrapper `builder` di `main.dart` berbasis `maxWidth: 480` yang terpusat rapi saat dijalankan di browser desktop, sehingga layout mobile-first tetap proporsional saat diuji di layar PC/laptop.
  - **Isolasi Fitur Platform Native:** Membungkus platform channel `FLAG_SECURE` dan `SystemChrome` di `exam_session_screen.dart` dengan kondisi `if (!kIsWeb)`.

---

## 3. Pembagian Peran (Human vs AI Contribution)

| Modul / Komponen | Peran Mahasiswa (Manual) | Peran Asisten AI |
| :--- | :--- | :--- |
| **Arsitektur Proyek & Folder Structure** | Menentukan arsitektur berbasis fitur (*feature-first* / layered architecture: `core`, `features`, `widgets`), memilih package dependency. | Merekomendasikan struktur hirarki file standar Flutter. |
| **Desain Sistem & Brand Identity** | Menentukan palet warna dari logo utama (`#161A29`, `#135CE2`, `#23B26D`, `#F99E15`), menolak latar putih polos dan meminta latar *soft slate-blue* (`#EFF3FA`). | Mengenerate kelas konstanta warna (`AppColors`) dan `AppTextStyles`. |
| **Mockup UI Figma** | Merancang seluruh mockup UI di Figma, menentukan layout, spacing, warna, dan flow navigasi antar-screen. | Mengimplementasikan desain dari referensi mockup ke kode Flutter. |
| **Galeri Dokumentasi Visual Mockup** | Memberikan instruksi penambahan mockup yang tersimpan di direktori `assets/` ke dalam `README.md`. | Mengelompokkan 19 tangkapan layar antarmuka ke dalam 5 kategori alur logis serta menyusun tata letak galeri tabel responsif di GitHub. |
| **Penyempurnaan Splash Sinematik (Minggu 6)** | Menginstruksikan penghapusan splash lama yang berkedip, tombol lewati, dan teks footer branding. | Merombak arsitektur `SplashScreen` menjadi pure video player dengan background matching dan membersihkan timer/overlay. |
| **Dukungan Web Debug Chrome (Minggu 6)** | Melaporkan kendala saat debugging di Chrome (layar terbelah putih dan stuck) disertai screenshot browser. | Mendiagnosis video autoplay policy & async timer hanging di web, menambahkan CSS background, dan membuat mobile preview frame. |
| **Video Splash Screen & Durasi 3–5s** | Menentukan durasi splash video 10 detik agar dipersingkat menjadi 3–5 detik dengan tombol lewati. | Mengimplementasikan kontrol `VideoPlayerController`, timer navigasi 3.8s, dan countdown UI. |
| **Tutorial Pengguna Baru (Onboarding)** | Mengarahkan pembuatan panduan cara memakai aplikasi untuk pengguna pertama kali install. | Merancang `OnboardingTutorialScreen` dengan `PageView`, dot indicator, dan integrasi `SharedPreferences`. |
| **Konfirmasi Kata Sandi & Validasi** | Mewajibkan input kata sandi 2 kali saat pendaftaran untuk mencegah kesalahan ketik pengguna. | Membuat field konfirmasi, *real-time match validator*, dan pengecekan form. |
| **Autentikasi Akun Google** | Meminta penambahan opsi masuk / daftar dengan Google untuk mempermudah akses siswa dan guru. | Merancang tombol berstandar Google, modal pemilih akun, dan *readiness bridge* Firebase/Supabase. |
| **Portal Guru & Menu Kelas Pertama** | Meminta agar saat masuk akun guru pendamping, menu yang pertama terbuka langsung adalah menu *Kelas*. | Mengubah parameter navigasi guru menjadi `initialIndex: 0` (`GuruDaftarAsesiScreen`). |
| **Pengaturan Guru & Chat Bot AI** | Meminta pembuatan antarmuka lengkap Pengaturan Guru dan layar interaktif AI Assistant. | Mengimplementasikan `GuruPengaturanScreen` dan `ChatBotScreen` dengan respons kontekstual UKK. |
| **Pembersihan Demo & Tanggal WIB** | Menginstruksikan penghapusan badge demo (gambar lampiran) dan penyesuaian tahun 2024 ke tanggal sekarang (WIB). | Menghapus widget Pusdatin/BNSP statis dan membuat `DateFormatter` berbasis waktu lokal HP. |
| **Penyelesaian Build APK & Gradle Windows** | Melaporkan kendala kompilasi APK (`BUILD FAILED`) beserta tangkapan layar terminal error. | Mendiagnosis galat *incremental cache locking* Windows, mengonfigurasi `kotlin.incremental=false`, dan menguji rilis APK. |
| **Debugging & Quality Assurance** | Menguji fungsionalitas, mengevaluasi lint issue dengan `flutter analyze`, serta memastikan zero error & zero warning. | Memperbaiki peringatan deprecated member (`activeThumbColor`), mengatasi overflow RenderFlex, dan menyelaraskan widget test. |

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

### Studi Kasus 3: Penyesuaian Durasi Video Splash Screen & Perbaikan RenderFlex Overflow Form
- **Tujuan / Instruksi (Prompt):**  
  *"Ganti splash screen dengan assets/splash-screen.mp4 tapi dibuat menjadi 3–5 detik saja padahal videonya 10 detik, dan buatkan konfirmasi kata sandi ganda pada saat pendaftaran."*
- **Keluaran Awal AI & Evaluasi Kritis:**  
  1. Video fisik berdurasi 10 detik jika diputar penuh akan memperlambat waktu pengguna untuk masuk ke aplikasi (*bad UX*). Mahasiswa mengarahkan agar dibatasi maksimal 3–5 detik. AI awalnya hanya memutar video tanpa batas penghentian otomatis.
  2. Pada form pendaftaran dan pengujian widget test, penambahan elemen judul baris NISN/NIP menyebabkan galat layout *RenderFlex overflowed by 14 pixels* pada layar berdimensi sempit.
- **Tindakan & Penyesuaian:**  
  1. Membatasi pemutaran video menggunakan `Timer` internal berdurasi 3.8 detik dan menambahkan tombol *Lewati* berhitung mundur agar pengguna dapat melompat langsung.
  2. Menambahkan `Expanded` pada label baris judul form untuk mencegah layout terpotong (*overflow*) pada semua resolusi layar ponsel.
  3. Menambahkan pengujian otomatis pada `test/widget_test.dart` dengan simulasi `SharedPreferences.setMockInitialValues` sehingga seluruh alur navigasi dari splash menuju onboarding dan login terverifikasi hijau 100%.

---

### Studi Kasus 4: Penanganan Galat Kompilasi APK Gradle `Could not close incremental caches` di Windows
- **Tujuan / Instruksi (Prompt):**  
  *"ini flutter build apk nya kenapa failed?" (disertai tangkapan layar terminal error assembleRelease)*
- **Keluaran Awal / Diagnosa Masalah:**  
  Log kompilasi menunjukkan `java.lang.Exception: Could not close incremental caches in ... build\video_player_android\kotlin\compileReleaseKotlin\cacheable\...`. Hal ini terjadi karena proses Kotlin daemon lama menahan handle file `.tab` di Windows saat proses kompilasi parallel.
- **Tindakan & Solusi:**  
  1. Menghentikan daemon yang tertahan melalui `gradlew.bat --stop`.
  2. Menambahkan `kotlin.incremental=false` pada `android/gradle.properties`.
  3. Memastikan `minSdk` minimal 21 di `android/app/build.gradle.kts` untuk plugin video.
  4. Menjalankan pengujian build hingga menghasilkan `app-release.apk` (54.2 MB) dengan status sukses (`BUILD SUCCESSFUL`).

---

### Studi Kasus 5: Penanganan Galat Debugging Flutter Web di Google Chrome (Autoplay Policy & Async Timer Hanging)
- **Tujuan / Instruksi (Prompt):**  
  *"ini ketika saya run debug menggunakan chrome tidak bisa, tolong perbaiki walaupun niat saya untuk mengembangkan aplikasi ini nantinya itu dalam bentuk mobile dulu, mungkin nanti tunggu aplikasi ini sudah layak digunakan di mobile barulah saya akan buat di webapp nya juga" (disertai tangkapan layar browser Chrome di mana layar sebelah kiri gelap dan sebelah kanan putih kosong serta stuck).*
- **Keluaran Awal / Diagnosa Masalah:**  
  1. Pada Flutter Web, pemutaran video `VideoPlayerController.asset` bersuara (`setVolume(1.0)`) dicegah oleh *Chrome Autoplay Policy* yang melempar exception `DOMException: play() failed because the user didn't interact with the document first`.
  2. Inisialisasi `_navigationTimer` sebelumnya diletakkan setelah baris `await _controller!.initialize()`. Jika inisialisasi decoding video di web menggantung (*unresolved Future*), maka timer navigasi tidak pernah terpicu sehingga aplikasi *freeze* selamanya di splash screen.
  3. Berkas `web/index.html` tidak memiliki styling latar belakang default sehingga sisi kanan layar di luar area canvas video tampil sebagai warna putih polos (*split-screen effect*).
- **Tindakan & Solusi:**  
  1. Memindahkan pemicuan `_navigationTimer` ke dalam `initState()` secara independen dari video controller, dengan durasi 2.5 detik pada web dan 3.8 detik pada mobile.
  2. Mengatur volume video ke `0.0` pada web (`kIsWeb`) dan menambahkan batas waktu inisialisasi `.timeout(const Duration(seconds: 2))`.
  3. Menambahkan styling CSS `background-color: #0F1523` pada `web/index.html` agar seluruh viewport browser berwarna gelap seragam sejak proses bootstrapping.
  4. Menambahkan wrapper responsif `maxWidth: 480` di `main.dart` agar tampilan mobile-first terpusat elegan saat diuji di layar desktop browser.

---

## 5. Rencana Target Fitur Menuju Akhir Semester (UAS)
1. **Integrasi Backend Database Nyata (Supabase & Firebase):** Mengaktifkan modul database real-time cloud menggantikan cache lokal sementara, mengaitkan autentikasi siswa dan guru ke live database.
2. **Penyimpanan Lokal Persisten Lanjutan (SQLite / Isar / Drift):** Menyempurnakan fitur *Offline-First* agar seluruh riwayat pengerjaan soal dan cache paket materi tersimpan permanen di perangkat lokal mahasiswa saat tidak ada sinyal di ruang ujian.
3. **Fitur Presensi / Validasi QR Code CBT Lab:** Menambahkan scanner kamera untuk memindai kode QR workstation lab komputer saat ujian simulasi UKK berlangsung.
4. **Penyempurnaan Kecerdasan Buatan UKKMate:** Menghubungkan chatbot asisten ke backend LLM API agar dapat memberikan jawaban analitis dinamis seputar kode program dan studi kasus siswa secara real-time.
