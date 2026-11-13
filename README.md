<p align="center">
  <img src="assets/logo.jpeg" width="120" alt="UKKMate Logo" />
</p>

# UKKMate: Aplikasi Simulasi dan Bank Soal Uji Kompetensi Keahlian untuk Siswa SMK

> **Mobile Programming**  
> **Nama:** Muhamad Khoirul Ramadhan  
> **NPM:** 2413025012  
> **Program Studi:** Pendidikan Teknologi Informasi  
> **Versi Aplikasi:** v0.2.11+23
> **Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 📌 Ringkasan Aplikasi
**UKKMate** adalah aplikasi mobile berbasis Flutter untuk membantu siswa SMK berlatih menghadapi Uji Kompetensi Keahlian (UKK). Aplikasi ini memiliki layar latihan, materi, tugas, simulasi CBT, profil siswa, dan portal guru.

Firebase Auth menangani akun; Supabase digunakan untuk data profil, materi, tugas, dan penyimpanan berkas. Integrasi native Google dan migration Firebase-to-Supabase sudah tersedia di kode, tetapi perlu konfigurasi Dashboard serta uji perangkat sebelum dinyatakan aktif untuk pengguna. *Offline-first* masih menjadi target: cache data persisten dan antrean sinkronisasi belum terhubung, sementara layar status sinkronisasi masih menampilkan contoh statis. Mockup pada galeri juga bukan bukti semua alur backend telah berfungsi.

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

## 🚀 Fitur Utama (Pembaruan v0.1.5 s/d v0.2.11)

1. **Video Splash Screen Sinematik 3 Detik Penuh (v0.2.0):**
   - Menampilkan berkas video animasi resolusi tinggi `assets/splash-screen.mp4` baru yang telah dipersingkat dan dioptimalkan menjadi tepat 3 detik.
   - Video kini diputar secara utuh hingga selesai (*completion listener*) tanpa dipotong atau terhenti mendadak.
   - Transisi layar bersih tanpa tampilan splash lama yang berkedip, tanpa tombol lewati, dan tanpa teks footer branding sehingga memberikan kesan visual aplikasi yang profesional.



2. **Panduan & Tutorial Aplikasi (Onboarding Walkthrough):**
   - Ditampilkan otomatis saat pertama kali pengguna menginstal dan membuka aplikasi (tersimpan via `SharedPreferences`).
   - Panduan visual 4 langkah: Pengenalan UKKMate, Simulasi CBT Digital, Asisten AI Pintar, dan Portal Guru Pendamping.
   - Dapat diakses kembali sewaktu-waktu melalui menu pengaturan profil siswa maupun pengaturan guru.

3. **Keamanan & Autentikasi Pengguna:**
   - **Konfirmasi Kata Sandi (2x Input):** Form pendaftaran siswa baru mewajibkan konfirmasi kata sandi dengan validasi kecocokan karakter secara *real-time* dan syarat minimal 8 karakter.
   - **Autentikasi Akun Google:** Aplikasi memakai `google_sign_in` native dan Firebase Auth. Pemilihan akun dan login langsung di APK belum diverifikasi pada perangkat; aktifkan Google provider dan daftarkan SHA-1 Android terlebih dahulu.
   - **Lupa Kata Sandi Interaktif:** Pengguna dapat menekan tautan *Lupa Kata Sandi?* untuk mengirimkan tautan reset kata sandi langsung ke email terdaftar Dapodik.

4. **Portal Guru Pendamping (Teacher Portal) Terarah:**
   - Saat masuk ke akun Guru Pendamping, aplikasi secara default langsung membuka menu **Kelas** (`initialIndex: 0` - `GuruDaftarAsesiScreen`) agar guru dapat langsung memverifikasi peserta dan rombel binaan.
   - Deteksi otomatis peran pengguna berdasarkan 18 digit NIP resmi.

5. **Pengaturan Guru Lengkap (Teacher Settings):**
   - Kartu profil guru berstatus asesor terverifikasi.
   - Kartu status sinkronisasi database cloud (Supabase Database & Firebase Messaging).
   - Pengaturan ujian CBT: Acak urutan butir soal, acak opsi pilihan jawaban (A–E), dan kontrol deteksi anti-kecurangan (*anti-cheat screen exit*).
   - Dialog konfirmasi keluar akun yang aman.

6. **Chatbot Bantuan Berbasis Aturan (Belum memakai LLM):**
   - Tombol melayang (`FloatingChatButton`) kini langsung membuka halaman percakapan interaktif **UKKMate AI Assistant** (`ChatBotScreen`).
   - Dilengkapi *quick prompts* seputar kisi-kisi UKK RPL, query database SQL, strategi manajemen waktu CBT, dan petunjuk sinkronisasi Dapodik.
   - Respons saat ini berasal dari aturan/kata kunci lokal; belum memanggil model AI/LLM atau backend. Label *Online* pada UI bukan status koneksi layanan AI.

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

12. **Dukungan Debug Web Browser Chrome (v0.1.9):**
    - Mengatasi masalah *stuck* splash screen di Chrome dengan inisialisasi timer independen dan penanganan batas waktu (*timeout*) decoding video.
    - Menyesuaikan *Autoplay Policy* browser Google Chrome dengan otomatisasi pembisuan audio (`setVolume(0.0)`) saat dijalankan di platform web.
    - Mencegah tampilan layar terbelah putih di browser melalui styling CSS `background-color: #0F1523` pada `web/index.html`.
    - Menyediakan *Mobile-Optimized Preview Frame* terpusat (`maxWidth: 480`) di desktop browser agar layout mobile dapat di-debug dengan proporsional dan nyaman.

13. **Resolusi Cross-Drive Path Gradle di Windows (v0.2.1):**
    - Memperbaiki galat `this and base files have different roots` pada Gradle saat proyek berada di drive berbeda (Drive D:) dari cache paket Pub (`C:\Users\...\AppData\Local\Pub\Cache`).
    - Memperbarui `android/build.gradle.kts` dengan validasi kecocokan drive root sebelum mengubah `buildDirectory` subproyek plugin pihak ketiga.
    - Menjamin kelancaran inspeksi ekstensi IDE Gradle for Java serta kompilasi APK debug/release secara mulus tanpa kegagalan task.

14. **Resolusi Notifikasi Java Language Server IDE (v0.2.2):**
    - Mendaftarkan deklarasi plugin `com.android.library` secara eksplisit pada `android/settings.gradle.kts` agar seluruh modul plugin Android mengenali versi AGP yang seragam.
    - Mengonfigurasi `.vscode/settings.json` dengan isolasi `java.import.gradle.enabled: false` untuk mencegah Language Server Red Hat Java mengimpor subproyek plugin Flutter sebagai root project Java independen.
    - Menghilangkan seluruh pop-up peringatan merah 'Source: Java' di IDE.

15. **Panduan Dasar Interaktif Popup Menu Pasca-Login (v0.2.3):**
    - Mengganti alur onboarding slide layar penuh sebelum login menjadi **Tur Interaktif Berbasis Popup Menu (Coach Mark / Spotlight)** yang muncul saat pengguna pertama kali berhasil masuk (*post-login* / *signup*).
    - Menampilkan kartu pop-up terarah dengan panah penunjuk (*pointer arrow*) ke masing-masing menu utama (Beranda, Latihan, Riwayat, Profil, dan AI Assistant) disertai penjelasan fungsi dasar yang ringkas, padat, dan esensial.
    - Dilengkapi kontrol langkah (*Kembali*, *Lanjut*, *Lewati*, *Mulai Jelajahi*), transisi pergantian tab otomatis secara *real-time*, dan opsi membuka kembali tur kapan saja dari menu Profil Siswa maupun Pengaturan Guru.
    - Splash screen kini langsung mengarahkan pengguna ke portal masuk (`LoginScreen`) secara mulus tanpa interupsi.

16. **Antarmuka Khusus Latihan Mandiri & Desain Sub-Menu Terpadu (v0.2.4):**
    - Memisahkan alur kartu grid *Latihan Mandiri* di dashboard siswa dari navigasi tab bar bawah, menggantikannya dengan halaman mandiri tersendiri (`LatihanMandiriScreen`).
    - Menyelaraskan tata letak header sub-menu dengan modul lainnya (`TugasScreen` & `MateriScreen`), dilengkapi tombol kembali (`arrow_back`), logo resmi UKKMate, judul sub-menu `UKKMATE CBT`, indikator status *Tersinkron*, dan foto profil asesi.
    - Dilengkapi fitur pendukung belajar mandiri: kartu target harian siswa, pemilihan 3 mode latihan (Drill Kilat, Studi Kasus, Uji Waktu), filter chip kategori kompetensi interaktif, daftar paket soal studi kasus terarah, serta kartu tips belajar sukses UKK.

17. **Rangkaian Progres Minggu ke-7 (v0.2.5–v0.2.11):**
    - **v0.2.5–v0.2.6:** Menyiapkan Firebase lintas platform dan konfigurasi Google Sign-In/OAuth.
    - **v0.2.7–v0.2.8:** Menambahkan konfigurasi Supabase lalu menghubungkan autentikasi dan data aplikasi ke Supabase.
    - **v0.2.9:** Mengaudit riwayat kredensial dan memperketat aturan pengabaian berkas lokal/rahasia.
    - **v0.2.10:** Mengalihkan Google Sign-In ke Firebase Auth native dan menyediakan Firebase ID token untuk Supabase Third-Party Auth/RLS.
    - **v0.2.11+23:** Mencatat evaluasi kesiapan serta meluruskan status *offline-first* dan chatbot pada dokumentasi.
    - `flutter analyze` bersih, 3 widget test lulus, dan APK debug berhasil dibangun. Login native di perangkat serta migration/backend live belum diverifikasi.

18. **Catatan Kesiapan Minggu ke-7 (v0.2.11):**
    - Pembaruan ini merapikan catatan proyek dan mengoreksi klaim *offline-first* serta chatbot agar sesuai implementasi saat ini.
    - Perhitungan hasil ujian, otorisasi guru lintas kelas, cache offline persisten, dan chatbot LLM tetap menjadi pekerjaan lanjutan.

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

### Konfigurasi Firebase Flutter
```bash
dart pub global activate flutterfire_cli
dart pub global run flutterfire_cli:flutterfire configure --project=ukkmate --platforms=android,ios,web
flutter pub get
```
- Perintah tersebut membuat atau memperbarui `lib/firebase_options.dart` dari aplikasi Firebase yang terdaftar.
- Untuk Flutter, gunakan paket Firebase di `pubspec.yaml`; jangan menambahkan Firebase iOS SDK secara manual lewat Swift Package Manager.
- Letakkan `GoogleService-Info.plist` di `ios/Runner/` dan pastikan Bundle ID sama dengan yang didaftarkan di Firebase.
- Letakkan `google-services.json` di `android/app/`; setelah mengaktifkan Google Sign-In, unduh ulang konfigurasi Android dan iOS dari Firebase Console.
- Untuk Android native account picker, aktifkan Google provider di **Firebase Authentication**, daftarkan SHA-1 aplikasi Android, lalu unduh `google-services.json` terbaru. Aplikasi memakai `google_sign_in` dan Firebase Auth credential, bukan Supabase browser OAuth.
- Build dan validasi iOS memerlukan macOS dengan Xcode; konfigurasi Flutter saja belum membuktikan build native berhasil.

### Konfigurasi Supabase Flutter
- Simpan Project URL dan publishable key di `BackendConfig`; publishable key memang ditujukan untuk aplikasi client.
- Jalankan migration `202611120001_profile_signup_metadata.sql` lalu `202611120002_firebase_auth_bridge.sql` dari folder `supabase/migrations/` melalui **Supabase → SQL Editor**.
- Di **Supabase → Authentication → Third-Party Auth**, tambahkan Firebase dengan Project ID `ukkmate`; Supabase memakai Firebase ID token untuk memeriksa RLS. Jangan gunakan **Authentication → Providers → Google** Supabase untuk tombol Google native aplikasi.
- Buat bucket private `avatars`, `materials`, dan `assignments`, lalu jalankan policies Storage yang sesuai dengan pola path `<firebase-uid>/...`.
- Pastikan schema `public` tersedia di Data API dan policy RLS tabel `users`, `materials`, serta `tasks` sudah aktif.
- Di Firebase Console, aktifkan provider Google dan pastikan SHA-1 dari signing certificate APK sudah terdaftar. Jika Firebase OAuth client dihapus, perbarui konfigurasi Google/Firebase lalu unduh `google-services.json` terbaru sebelum build dan instal ulang APK.
- Error `deleted_client` dari Supabase Google Provider tidak berlaku untuk flow native Firebase; flow aplikasi tidak memakai redirect OAuth Supabase.
- Login email/password dan Google dikelola Firebase; NISN/NIP hanya data profil. Role guru harus ditetapkan oleh admin, bukan pengguna client.
- Sesi CBT baru mencatat mulai/keluar; tabel `exam_results` dan perhitungan nilai tepercaya belum terhubung. Akses guru/admin lintas kelas juga menunggu tabel relasi kelas dan policy khusus.
- Integrasi sekarang dikumpulkan di `BackendConfig`; pemisahan ke `auth_service.dart`, `supabase_service.dart`, dan `firebase_service.dart` masih menjadi perapian arsitektur berikutnya.
- Aktifkan Row Level Security (RLS) dan buat policy sebelum tabel diakses dari aplikasi.
- Jangan pernah menaruh service-role atau secret API key di aplikasi Flutter atau repositori.

### Keamanan kredensial
- Firebase API key dan Supabase publishable key adalah konfigurasi client yang memang terlihat di aplikasi; batasi penggunaannya pada layanan yang diperlukan dan lindungi data memakai RLS, Storage policies, serta aturan Firebase.
- OAuth client secret, Supabase secret/service-role, signing key, dan password hanya untuk lingkungan backend tepercaya; jangan simpan di Flutter, Git, atau chat.
- File `.env`, folder `secrets/`, dan keystore lokal diabaikan oleh Git.

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
