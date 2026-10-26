# DEKLARASI TRANSPARANSI PENGGUNAAN KECERDASAN BUATAN (AI_DECLARATION.md)

**Mata Kuliah:** Mobile Programming  
**Sifat Ujian / Tugas:** Proyek Mandiri (Pengembangan Berkelanjutan Menuju UAS)  
**Nama Mahasiswa:** Muhamad Khoirul Ramadhan  
**NPM:** 2413025012  
**Program Studi:** Pendidikan Teknologi Informasi  
**Judul Aplikasi:** UKKMate: Aplikasi Simulasi dan Bank Soal Uji Kompetensi Keahlian untuk Siswa SMK  
**Versi Saat Ini:** v0.2.4 (Antarmuka Khusus Latihan Mandiri & Desain Sub-Menu Terpadu)  
**Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 1. Daftar Alat Kecerdasan Buatan (AI Tools)
Dalam pengembangan aplikasi UKKMate mulai dari inisiasi, UTS, hingga Progres 5 dan Progres Minggu ke 6, alat bantu AI yang digunakan adalah:
1. **GitHub Copilot (VS Code Extension):** Digunakan untuk autocompletion kode, pembuatan boilerplate layout widget Flutter, serta penulisan sintaks model data awal.
2. **Google Antigravity / Gemini 3.8 Flash (High):** Digunakan sebagai *collaborative coding partner* dalam arsitektur perangkat lunak, perancangan antarmuka responsif sesuai kebutuhan pengguna, perbaikan galat lint (*static analysis*), integrasi alur autentikasi, dan otomatisasi deployment repositori Git.

---

## 2. Linimasa, Versi Rilis, & Riwayat Progres Pengembangan

Pengerjaan dan rilis versi aplikasi UKKMate dibangun secara bertahap dan terencana dengan penomoran versi berkala:

| Periode | Versi Rilis | Fokus Pengembangan Utama |
| :--- | :--- | :--- |
| **Minggu 1 – 2** | **v0.0.1** | Inisiasi proyek Flutter, *design system*, autentikasi NISN/NIP, modul materi, tugas lab, dan dashboard siswa. |
| **Minggu 3 – 4** | **v0.0.3** | Katalog bank soal bertingkat, riwayat & analitik capaian kompetensi, arsitektur *Offline-First caching*, serta validasi profil Dapodik. |
| **Minggu 5** | **v0.0.5** | Sesi ujian CBT interaktif (`LatihanSoalScreen`), Portal Guru Pendamping (Dashboard & Daftar Asesi), penyelarasan warna tema logo, dan finalisasi berkas UTS. |
| **Minggu 6**<br>*(UTS & Progres Berkelanjutan)* | • **v0.1.0** (UTS)<br>• **v0.1.5** (Progres 5)<br>• **v0.1.6**<br>• **v0.1.7**<br>• **v0.1.8**<br>• **v0.1.9**<br>• **v0.2.0**<br>• **v0.2.1**<br>• **v0.2.2**<br>• **v0.2.3**<br>• **v0.2.4** | • **v0.1.0 (UTS):** Smooth navigation guru, floating AI chatbot scaffolding, keamanan ujian (anti-screenshot & anti-copy), Bank Soal guru, dan penyempurnaan UI.<br>• **v0.1.5 (Progres 5):** Video splash screen (3-5s), tutorial pengguna baru, konfirmasi kata sandi pendaftaran, login Google, lupa kata sandi via email, direct access tab Kelas untuk guru, UI Pengaturan Guru lengkap, implementasi UI interaktif Chat Bot AI, pembersihan data demo, dan penyesuaian tanggal dinamis (WIB).<br>• **v0.1.6:** Perbaikan kegagalan build APK di Windows (`kotlin.incremental=false`), penghentian daemon pengunci file, konfigurasi `minSdk 21`, dan optimasi kompilasi `assembleRelease`.<br>• **v0.1.7:** Integrasi galeri visual 19 mockup UI aplikasi ke `README.md`, penambahan logo header terpusat, pengelompokan alur antarmuka komprehensif, dan sinkronisasi versi aplikasi.<br>• **v0.1.8:** Penyempurnaan video splash screen murni sinematik: penghapusan kedipan splash screen lama (fallback UI), penghapusan tombol lewati & overlay branding footer, serta inisiasi progres Minggu ke 6.<br>• **v0.1.9:** Dukungan debugging web browser Google Chrome: inisialisasi timer independen anti-stuck, penyesuaian Chrome Autoplay Policy (`volume 0`), CSS styling background di `index.html`, isolasi platform channel web, dan frame preview responsif (`maxWidth: 480`).<br>• **v0.2.0:** Implementasi pemutaran penuh video splash screen 3 detik (`assets/splash-screen.mp4`) hingga selesai tanpa dipotong (*video completion listener*), buffer timer toleransi dinamis, dan penyelesaian modul splash Minggu ke 6.<br>• **v0.2.1:** Perbaikan galat Gradle build `this and base files have different roots` di Windows akibat pemisahan drive proyek (Drive D:) dan Pub Cache (Drive C:) melalui pengecekan drive root pada `android/build.gradle.kts`.<br>• **v0.2.2:** Penambahan deklarasi plugin `com.android.library` di `android/settings.gradle.kts` dan konfigurasi isolasi Java Language Server pada `.vscode/settings.json` untuk menghilangkan galat notifikasi IDE 'Source: Java'.<br>• **v0.2.3:** Transformasi tutorial menjadi tur interaktif pop-up menu pasca-login (coach mark spotlight), direct splash navigation ke login, sinkronisasi tab reaktif, dan pemicuan tur dari profil/pengaturan guru.<br>• **v0.2.4:** Pemisahan alur kartu 'Latihan Mandiri' di beranda siswa menjadi layar tersendiri (`LatihanMandiriScreen`) berstandar sub-menu (tombol kembali, logo resmi UKKMate, status tersinkron, foto profil), hero target harian, 3 mode latihan, filter chips kategori kompetensi, dan daftar studi kasus. |







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

### 📅 Progres Minggu ke 6 (Rilis v0.2.0): Pemutaran Penuh Video Splash Screen 3 Detik (Full Playback)
- **Fokus Utama:** Memperbarui logika pemutaran splash screen agar memutar berkas video `assets/splash-screen.mp4` baru yang telah disunting pengguna menjadi tepat 3 detik secara penuh hingga selesai tanpa dipotong paksa oleh timer.
- **Implementasi:**
  - Menghubungkan listener `_controller!.addListener(_handleVideoProgress)` untuk mendeteksi event saat posisi pemutaran mencapai batas akhir durasi video (`position >= duration`).
  - Menghapus pembatasan pemotongan durasi paksa (3.8s) dan menggantinya dengan navigasi reaktif berbasis penyelesaian video secara alami.
  - Menambahkan buffer toleransi fallback dinamis `duration + 300ms` untuk memastikan navigasi tetap terjamin 100% jika terjadi keterlambatan decoding frame di lingkungan perangkat tertentu.
  - Sinkronisasi versi aplikasi ke `v0.2.0+12`.

### 📅 Progres Minggu ke 6 (Rilis v0.2.1): Resolusi Cross-Drive Path Gradle di Windows & Stabilisasi IDE
- **Fokus Utama:** Menyelesaikan kegagalan inspeksi Gradle build pada IDE (`Could not create task ':shared_preferences_android:compileDebugUnitTestSources'. > this and base files have different roots`) yang terjadi karena pemisahan drive antara proyek (Drive D:) dan pub cache (Drive C:).
- **Implementasi:**
  - Menambahkan pengecekan kesamaan drive root (`projectRoot == rootProjectRoot`) pada blok konfigurasi `subprojects` di berkas `android/build.gradle.kts`.
  - Mengizinkan plugin Flutter di pub cache menggunakan direktori build standarnya sendiri sehingga operasi Java path relativization antar file selalu berada di drive yang sama.
  - Pengujian eksekusi `gradlew tasks` dan `flutter build apk --debug` terverifikasi sukses 100% tanpa galat.
  - Sinkronisasi versi aplikasi ke `v0.2.1+13`.

### 📅 Progres Minggu ke 6 (Rilis v0.2.2): Resolusi Notifikasi Java Language Server & Deklarasi Plugin Library
- **Fokus Utama:** Mengatasi notifikasi pop-up kesalahan merah di IDE (`Source: Java`) di mana Language Server mencoba mengonfigurasi subproyek plugin (`video_player_android`, `jni`, `shared_preferences_android`) sebagai root project Java independen dan melaporkan `Plugin [id: 'com.android.library'] was not found`.
- **Implementasi:**
  - Menambahkan deklarasi eksplisit `id("com.android.library") version "9.1.0" apply false` di dalam blok `plugins` pada `android/settings.gradle.kts` agar Gradle resolution mengenali versi AGP Library yang seragam untuk semua subproyek plugin.
  - Menambahkan konfigurasi isolasi `java.import.gradle.enabled: false` dan `java.autobuild.enabled: false` pada `.vscode/settings.json` sehingga Java Language Server Red Hat tidak mencoba mengompilasi subproyek internal Flutter secara terpisah.
  - Sinkronisasi versi aplikasi ke `v0.2.2+14`.

### 📅 Progres Minggu ke 6 (Rilis v0.2.3): Transformasi Tur Interaktif Popup Menu Pasca-Login & Direct Splash
- **Fokus Utama:** Mengganti konsep tutorial carousel onboarding pra-login yang statis menjadi tur interaktif berbasis kartu pop-up (*in-app coach marks / feature spotlight*) yang muncul saat pengguna pertama kali berhasil masuk (*post-login* / *signup*) ke dashboard utama.
- **Implementasi:**
  - Membuat modul `InteractiveTourOverlay` dan `TourStep` di `lib/features/onboarding/interactive_menu_tour.dart` dengan visual kartu melayang, panah segitiga penunjuk (*pointer arrow*), badge langkah, serta tombol *Kembali*, *Lanjut*, *Lewati*, dan *Mulai Jelajahi*.
  - Menghubungkan tur reaktif ke `MainNavigation` (Siswa) dan `GuruNavigation` (Guru) dengan deteksi status `SharedPreferences` (`has_seen_menu_tour` dan `has_seen_guru_tour`).
  - Mengimplementasikan sinkronisasi tab navigasi dinamis: antarmuka secara otomatis berpindah ke tab yang sedang diterangkan (Beranda, Latihan, Riwayat, Profil, serta Floating Chat AI) agar pengguna memahami fungsi nyata tiap menu.
  - Memperbarui `SplashScreen` agar langsung mengarahkan pengguna ke `LoginScreen` tanpa hambatan alur slide onboarding sebelum login.
  - Menambahkan opsi pemicuan kembali tur interaktif dari menu Profil Siswa dan Pengaturan Guru (`startTour(context)`).
  - Sinkronisasi versi aplikasi ke `v0.2.3+15` dan penambahan unit test `testWidgets` di `test/widget_test.dart`.

### 📅 Progres Minggu ke 6 (Rilis v0.2.4): Antarmuka Khusus Latihan Mandiri & Sub-Menu Terpadu
- **Fokus Utama:** Memisahkan alur kartu grid 'Latihan Mandiri' di dashboard siswa yang sebelumnya mengalihkan ke tab bar bawah (Tab Latihan), digantikan dengan layar antarmuka tersendiri (`LatihanMandiriScreen`) dengan desain sub-menu berstandar penuh (tombol kembali, logo resmi, foto profil, dan status tersinkron).
- **Implementasi:**
  - Membuat halaman `LatihanMandiriScreen` (`lib/features/latihan/latihan_mandiri_screen.dart`) dengan struktur header sub-menu standar: tombol `arrow_back`, logo resmi `assets/logo.jpeg`, teks `'UKKMATE CBT'`, judul `'Latihan Mandiri'`, badge status `'Tersinkron'`, dan `CircleAvatar` foto profil siswa (`assets/pp_default_laki-laki.jpg`).
  - Menyediakan kartu ringkasan target belajar harian siswa (target harian selesai 4/5 soal, metrik akurasi 85%, tombol lanjutkan sesi).
  - Menyediakan pilihan 3 mode latihan mandiri terarah: *Drill Kilat* (10 soal kilat), *Studi Kasus* (paket soal terstruktur per elemen), dan *Uji Waktu* (simulasi ujian dengan batas waktu ketat), yang masing-masing terhubung langsung ke sesi CBT `LatihanSoalScreen`.
  - Menyediakan filter chip horizontal interaktif untuk elemen kompetensi (Semua Elemen, Pemrograman Web, Basis Data & SQL, Jaringan Komputer, Pemrograman Objek).
  - Menghadirkan daftar paket soal studi kasus interaktif lengkap dengan tag kejuruan RPL/TKJ, tingkat kesulitan, durasi, jumlah soal, capaian skor, dan tombol aksi "Mulai Latihan" / "Ulangi Latihan".
  - Menyertakan kartu tips belajar mandiri sukses UKK untuk meningkatkan motivasi dan kesiapan asesi.
  - Mengubah aksi `onTap` pada kartu grid "Latihan Mandiri" di `HomeScreen` dari `MainNavigation.switchTab(context, 1)` menjadi `Navigator.push(context, MaterialPageRoute(builder: (_) => const LatihanMandiriScreen()))`.
  - Sinkronisasi versi aplikasi ke `v0.2.4+16`.

---

## 3. Pembagian Peran (Human vs AI Contribution)

Pembagian peran kolaboratif antara mahasiswa dan asisten AI dikelompokkan secara terstruktur, urut, dan sistematis per minggu pengerjaan (Minggu 1 s/d Minggu 6):

| Minggu / Tahapan | Modul & Fokus Fitur | Kontribusi & Arahan Mahasiswa (Manual) | Implementasi Asisten AI |
| :--- | :--- | :--- | :--- |
| **Minggu 1** | Inisiasi Proyek, Desain Sistem & Brand Identity | • Menentukan arsitektur perangkat lunak berbasis fitur (*feature-first*: `core`, `features`, `widgets`).<br>• Menentukan palet warna dari logo utama (`#161A29`, `#135CE2`, `#23B26D`, `#F99E15`), menolak latar putih polos dan meminta latar *soft slate-blue* (`#EFF3FA`).<br>• Merancang skema form login terpadu (NISN & NIP) dan pendaftaran akun siswa baru. | • Merekomendasikan struktur hirarki file standar Flutter dan setup `pubspec.yaml`.<br>• Mengenerate kelas konstanta warna (`AppColors`) dan tipografi Google Fonts Inter (`AppTextStyles`).<br>• Membuat form login/register awal dengan validasi dasar. |
| **Minggu 2** | Antarmuka Siswa, Modul Materi & Penugasan Lab | • Merancang seluruh mockup antarmuka siswa di Figma (layout, spacing, dan alur navigasi).<br>• Menentukan kebutuhan banner penanggalan, target kelulusan UKK, modul materi kejuruan, dan checklist tugas praktikum lab. | • Mengimplementasikan layout `HomeScreen` (Hero card ujian UKK, grid menu cepat, dan card statistik progres).<br>• Membangun layar modul `MateriScreen` dengan tautan video tutorial YouTube dan `TugasScreen` checklist tugas praktikum lab. |
| **Minggu 3** | Bank Soal, Latihan Mandiri & Analitik Progres | • Mengarahkan pembuatan sistem klasifikasi tingkat kesulitan bank soal (Dasar, Menengah, Mahir).<br>• Menentukan format visualisasi rekap capaian nilai dan grafik histori kelulusan kompetensi kejuruan. | • Mengembangkan `LatihanScreen` dengan filter tingkat kompetensi dan kartu bank soal interaktif.<br>• Membangun `RiwayatScreen` dengan ringkasan persentase kelulusan, grafik progres skor, dan badge status kompeten. |
| **Minggu 4** | Arsitektur Offline-First & Profil Dapodik | • Mewajibkan arsitektur *Offline-First* agar materi dan bank soal dapat diakses saat internet lab sekolah offline.<br>• Meminta validasi data akademik Dapodik terenkripsi dan foto profil default berbasis jenis kelamin siswa (bukan ikon generic). | • Merancang mekanisme caching lokal dan pemantauan antrean sinkronisasi pada `StatusSinkronisasiScreen`.<br>• Mengimplementasikan `ProfilSiswaScreen` dengan pemetaan foto profil `pp_default_laki-laki.jpg` dan `pp_default_perempuan.jpg`. |
| **Minggu 5** | Portal Guru Pendamping & Simulasi CBT Interaktif | • Mengarahkan pembuatan portal khusus guru pembimbing asesi dengan default menu langsung ke tab Kelas.<br>• Menentukan mekanisme simulasi CBT: pilihan ganda interaktif, durasi ujian, status ragu-ragu, dan navigasi butir soal.<br>• Menginstruksikan integrasi navigasi lintas modul untuk persiapan penilaian UTS. | • Membangun `GuruDashboardScreen` (pantauan live exam) dan `GuruDaftarAsesiScreen` (manajemen rombel XII RPL 1 & 2).<br>• Mengembangkan `LatihanSoalScreen` CBT interaktif dengan kalkulasi skor otomatis dan pembahasan detail.<br>• Menghubungkan seluruh pintasan navigasi dan memastikan status zero lint errors (`flutter analyze`). |
| **Minggu 6**<br>*(UTS & Progres Berkelanjutan s/d v0.2.4)* | Refinement Splash, Keamanan CBT, Debug Chrome, Stabilitas Gradle, Tur Popup Menu, & Sub-Menu Latihan Mandiri | • **Keamanan Ujian:** Menentukan proteksi tangkapan layar (`FLAG_SECURE`) dan anti-copy teks pada sesi ujian CBT.<br>• **Visual Mockup:** Memberikan instruksi integrasi galeri 19 mockup UI ke `README.md`.<br>• **Penyempurnaan Splash:** Menginstruksikan penghapusan splash lama yang berkedip, tombol lewati, teks footer branding, dan memutar video 3 detik utuh tanpa terpotong.<br>• **Debug Web Chrome:** Melaporkan kendala debugging di Google Chrome (layar terbelah putih dan video hanging).<br>• **Stabilitas Gradle Windows:** Melaporkan kendala kompilasi APK release, cross-drive path (`D:\` vs `C:\`), dan pop-up error `Source: Java` di IDE.<br>• **Tur Interaktif Popup Menu:** Mengarahkan perombakan tutorial agar tidak berupa slide sebelum login, melainkan petunjuk popup terarah tiap menu pasca-login/signup dengan panduan dasar esensial yang ringkas.<br>• **Sub-Menu Latihan Mandiri:** Menginstruksikan perbaikan kartu "Latihan Mandiri" di dashboard agar tidak lagi mengalihkan ke tab bar bawah, melainkan dibuatkan tampilan layar tersendiri yang konsisten dengan sub-menu lain lengkap dengan tombol kembali, logo resmi, status tersinkron, dan foto profil. | • Mengimplementasikan platform channel `FLAG_SECURE` native Android dan `SelectionContainer.disabled`.<br>• Menyusun tata letak galeri tabel responsif 19 mockup UI di `README.md`.<br>• Merombak `SplashScreen` menjadi pemutar video sinematik murni (`position >= duration`) dengan background `#0F1523`.<br>• Mengatasi autoplay policy web (`volume 0`), async timer independen, dan preview frame desktop responsif (`maxWidth: 480`).<br>• Mendiagnosis cache locking (`kotlin.incremental=false`), validasi drive root di `build.gradle.kts`, deklarasi `com.android.library` di `settings.gradle.kts`, dan isolasi Java Language Server di `.vscode/settings.json`.<br>• Mengembangkan `InteractiveTourOverlay` (coach mark popup dengan pointer arrow dinamis dan live tab switching) pada `MainNavigation` dan `GuruNavigation`, direct splash navigation ke login, serta pengujian widget test otomatis.<br>• Mengembangkan `LatihanMandiriScreen` dengan header sub-menu terpadu (tombol back, logo `assets/logo.jpeg`, badge tersinkron, foto profil asesi), hero target harian, 3 mode latihan mandiri, filter chip elemen kompetensi, daftar paket studi kasus interaktif, serta menghubungkan navigasi kartu beranda via `Navigator.push`. |

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

### Studi Kasus 6: Penanganan Galat Gradle Build Cross-Drive Path di Windows (`this and base files have different roots`)
- **Tujuan / Instruksi (Prompt):**  
  *"itu kenapa gradle build error ya, coba perbaiki" (disertai log terminal ekstensi Gradle for Java di mana eksekusi task gagal dengan exception "Could not create task ':shared_preferences_android:compileDebugUnitTestSources'. > this and base files have different roots: D:\Coding\Flutter\ukkmate\build\shared_preferences_android and C:\Users\muham\AppData\Local\Pub\Cache\hosted\pub.dev\shared_preferences_android-2.4.28\android").*
- **Keluaran Awal / Diagnosa Masalah:**  
  1. Pada sistem operasi Windows, proyek aplikasi UKKMate berada di Drive `D:` (`D:\Coding\Flutter\ukkmate`), sedangkan seluruh paket pustaka (Pub Cache) tersimpan secara default di Drive `C:` (`C:\Users\muham\AppData\Local\Pub\Cache`).
  2. Blok konfigurasi `subprojects` di `android/build.gradle.kts` secara agresif memaksa seluruh `buildDirectory` subproyek (termasuk modul plugin yang berada di Drive C:) ke dalam direktori build aplikasi di Drive D:.
  3. Saat Gradle 9.x dan Android Gradle Plugin membuat task `compileDebugUnitTestSources`, Gradle memanggil `Path.relativize()` antara file base dan file target. Karena kedua file memiliki drive root yang berbeda (D: vs C:), Java melempar `IllegalArgumentException: this and base files have different roots`.
- **Tindakan & Solusi:**  
  1. Menambahkan validasi drive root `projectRoot == rootProjectRoot` di `android/build.gradle.kts` sebelum memodifikasi `buildDirectory` subproyek.
  2. Membiarkan subproyek plugin pihak ketiga menggunakan direktori build standarnya sendiri sehingga operasi path relativization selalu berada dalam drive yang sama.
  3. Memverifikasi eksekusi `.\gradlew.bat tasks` dan kompilasi APK (`flutter build apk --debug`) hingga keduanya berhasil 100% (*BUILD SUCCESSFUL*).

---

### Studi Kasus 7: Penanganan Galat Pop-Up Language Server Java IDE (`Plugin [id: 'com.android.library'] was not found`)
- **Tujuan / Instruksi (Prompt):**  
  *"source java ini kenapa error ya, coba tolong perbaiki" (disertai tangkapan layar pop-up notifikasi kesalahan merah IDE "Source: Java" yang melaporkan kegagalan konfigurasi root project 'video_player_android', 'jni', 'shared_preferences_android', 'jni_flutter' dengan keterangan "Plugin [id: 'com.android.library'] was not found in any of the following sources").*
- **Keluaran Awal / Diagnosa Masalah:**  
  1. Ekstensi Red Hat Java / Language Server for Java di Antigravity IDE (VS Code) mendeteksi file build Gradle pada folder plugin Android di direktori cache Pub dan secara keliru memperlakukan masing-masing folder plugin tersebut sebagai *root project* Java mandiri, bukan sebagai subproyek yang dikelola oleh Flutter.
  2. Ketika subproyek tersebut dievaluasi secara terisolasi oleh Language Server, deklarasi plugin `com.android.library` tidak ditemukan karena plugin tersebut diaplikasikan tanpa menyertakan nomor versi eksplisit di submodul, sementara berkas root `android/settings.gradle.kts` awalnya hanya mendaftarkan `com.android.application`.
  3. Akibatnya, IDE memunculkan notifikasi galat merah bertubi-tubi ("Source: Java") di pojok kanan bawah editor setiap kali proses *indexing* atau *auto-build* Java berlangsung.
- **Tindakan & Solusi:**  
  1. Mendaftarkan plugin `com.android.library` secara eksplisit dengan nomor versi Android Gradle Plugin yang konsisten (`id("com.android.library") version "9.1.0" apply false`) di dalam blok `plugins { ... }` pada berkas `android/settings.gradle.kts`. Hal ini menjamin tersedianya resolusi versi `com.android.library` bagi seluruh subproyek Android.
  2. Mengonfigurasi isolasi Language Server pada `.vscode/settings.json` dengan menyetel `"java.import.gradle.enabled": false` dan `"java.autobuild.enabled": false` agar ekstensi Java di IDE tidak memindai subproyek internal Flutter pihak ketiga sebagai proyek Java terpisah di luar alur resmi Flutter Tools.
  3. Memvalidasi bahwa seluruh analisis statis (`flutter analyze`) dan pengujian widget (`flutter test`) lulus 100% tanpa hambatan.

---

### Studi Kasus 8: Transformasi Panduan Onboarding Menjadi Tur Interaktif Popup Menu Pasca-Login (Feature Spotlight / Guided Tour)
- **Tujuan / Instruksi (Prompt):**  
  *"untuk petunjuk pertama kali pengguna masuk itu bukan seperti itu yang saya mau, tapi setelah signup atau login pengguna baru itu di beri petunjuk tiap menu terus ada keterangan teks nya gitu di popup in ngerti ga, jadi seperti panduan dasar gitu jangan semua nya di jelaskan, jadi petunjuk itu untuk pengguna supaya tau menggunakan aplikasi saya"*
- **Keluaran Awal / Diagnosa Masalah:**  
  1. Pada implementasi sebelumnya, panduan pengguna baru berupa `OnboardingTutorialScreen` (carousel 4 slide layar penuh) yang muncul di antara *SplashScreen* dan *LoginScreen*.
  2. Model onboarding pra-login tersebut membebani pengguna dengan informasi teoritis sebelum mereka sempat masuk atau mencoba antarmuka aplikasi (*cognitive overload* sebelum autentikasi).
  3. Mahasiswa menginginkan panduan praktis yang tampil langsung di atas antarmuka kerja (*in-context*) setelah login/signup, menyoroti tiap-tiap menu secara berurutan dengan kartu popup dan teks keterangan esensial yang ringkas.
- **Tindakan & Solusi:**  
  1. **Direct Splash Navigation:** Memodifikasi `SplashScreen` agar setelah video 3 detik selesai langsung melakukan transisi mulus ke `LoginScreen`.
  2. **Pembuatan Widget Tur Terarah (`InteractiveTourOverlay`):** Merancang overlay semitransparan dengan kartu pop-up modern di atas navigasi bawah yang dilengkapi panah segitiga penunjuk (*pointer arrow*) terhitung dinamis sesuai posisi tab aktif maupun tombol melayang FAB.
  3. **Penjelasan Dasar & Ringkas:** Menetapkan 5 langkah petunjuk esensial (Beranda, Latihan, Riwayat, Profil, AI Assistant) dengan teks padat 1–2 kalimat yang fokus pada fungsionalitas harian siswa dan guru.
  4. **Sinkronisasi Tab Reaktif:** Mengintegrasikan tur ke dalam `MainNavigation` dan `GuruNavigation`, sehingga saat tombol *Lanjut* ditekan, tab aplikasi ikut berganti secara *real-time* ke menu terkait.
  5. **Pengujian Otomatis:** Menambahkan skenario uji widget di `test/widget_test.dart` untuk memverifikasi munculnya langkah pertama, transisi ke langkah berikutnya, dan penutupan tur via tombol silang/lewati.

---

### Studi Kasus 9: Pemisahan Navigasi Latihan Mandiri Menjadi Layar Mandiri Berstandar Sub-Menu
- **Tujuan / Instruksi (Prompt):**  
  *"coba lihat pada menu latihan mandiri, itukan malah masuk ke menu latihan yang ada di bar bawah itu, nah saya mau jangan masuk ke menu latihan bawah, coba buat tampilan tersendiri supaya tidak aneh, kan udah ada menu nya di bar bawah, untuk menu nya nanti samakan dengan menu yang lain ya untuk sub menu ada tombol kembali logo foto profil dan lain lain"*
- **Keluaran Awal / Diagnosa Masalah:**  
  1. Pada beranda siswa (`HomeScreen`), terdapat 4 kartu grid menu cepat: "Latihan Mandiri", "Tugas & PR", "Materi & Modul", dan "Pusat Bantuan".
  2. Tiga kartu lainnya ("Tugas & PR", "Materi & Modul", "Pusat Bantuan") masing-masing membuka layar sub-menu mandiri via `Navigator.push` yang dilengkapi header standar (tombol kembali `arrow_back`, logo resmi UKKMate, badge tersinkron, dan foto profil).
  3. Namun kartu "Latihan Mandiri" sebelumnya diprogram untuk memanggil `MainNavigation.switchTab(context, 1)` yang sekadar menggeser tab ke menu *Latihan* di bottom bar. Hal ini menimbulkan inkonsistensi UX (*user experience* terasa aneh dan canggung karena pengguna merasa dialihkan ke tab bar global alih-alih masuk ke halaman spesifik latihan mandiri).
- **Tindakan & Solusi:**  
  1. **Rancang Layar Sub-Menu Terpadu (`LatihanMandiriScreen`):** Membangun layar baru dengan standar header sub-menu yang identik dengan modul `TugasScreen` dan `MateriScreen`, memuat tombol kembali (`arrow_back`), logo resmi (`assets/logo.jpeg`), label sistem `'UKKMATE CBT'`, judul `'Latihan Mandiri'`, badge status `'Tersinkron'`, dan `CircleAvatar` foto profil (`assets/pp_default_laki-laki.jpg`).
  2. **Desain Konten Latihan Mandiri Interaktif:** Menghadirkan fitur komprehensif bagi asesi yang ingin belajar mandiri, meliputi kartu target progres harian, 3 pilihan mode latihan (Drill Kilat, Studi Kasus, Uji Waktu), filter chip kategori kompetensi, serta daftar paket soal studi kasus interaktif terarah.
  3. **Penyelarasan Navigasi di Beranda:** Mengalihkan navigasi kartu "Latihan Mandiri" di `HomeScreen` menggunakan `Navigator.push` menuju `LatihanMandiriScreen()`, sehingga keempat kartu grid kini memiliki perilaku navigasi yang 100% konsisten.
  4. **Verifikasi Kualitas Kode:** Memastikan seluruh pengujian otomatis lulus (`flutter test`) dan analisis statis bebas dari peringatan (`flutter analyze`).

---

## 5. Rencana Target Fitur Menuju Akhir Semester (UAS)
1. **Integrasi Backend Database Nyata (Supabase & Firebase):** Mengaktifkan modul database real-time cloud menggantikan cache lokal sementara, mengaitkan autentikasi siswa dan guru ke live database.
2. **Penyimpanan Lokal Persisten Lanjutan (SQLite / Isar / Drift):** Menyempurnakan fitur *Offline-First* agar seluruh riwayat pengerjaan soal dan cache paket materi tersimpan permanen di perangkat lokal mahasiswa saat tidak ada sinyal di ruang ujian.
3. **Fitur Presensi / Validasi QR Code CBT Lab:** Menambahkan scanner kamera untuk memindai kode QR workstation lab komputer saat ujian simulasi UKK berlangsung.
4. **Penyempurnaan Kecerdasan Buatan UKKMate:** Menghubungkan chatbot asisten ke backend LLM API agar dapat memberikan jawaban analitis dinamis seputar kode program dan studi kasus siswa secara real-time.

