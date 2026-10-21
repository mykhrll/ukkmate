# DEKLARASI TRANSPARANSI PENGGUNAAN KECERDASAN BUATAN (AI_DECLARATION.md)

**Mata Kuliah:** Mobile Programming  
**Sifat Ujian:** Proyek Mandiri (Ujian Tengah Semester - UTS)  
**Nama Mahasiswa:** Muhamad Khoirul Ramadhan  
**NIM:** 2413025012  
**Judul Aplikasi:** UKKMate (Aplikasi Pendamping & Uji Kompetensi Keahlian SMK Berbasis Offline-First)  
**Tautan Repositori:** https://github.com/mykhrll/ukkmate  

---

## 1. Daftar Alat Kecerdasan Buatan (AI Tools)
Dalam pengembangan prototipe aplikasi UKKMate hingga pekan UTS, alat bantu AI yang digunakan adalah:
1. **GitHub Copilot (VS Code Extension):** Digunakan untuk autocompletion kode, boilerplate layout widget Flutter, serta sintaks pemodelan data.
2. **Google Antigravity / Gemini:** Digunakan sebagai *collaborative coding partner* dalam mendesain antarmuka responsif sesuai mockup UI, analisis statis kode (*static analysis*), serta refactoring navigasi antarlayar.

---

## 2. Pembagian Peran (Human vs AI Contribution)

| Modul / Komponen | Peran Mahasiswa (Manual) | Peran Asisten AI |
| :--- | :--- | :--- |
| **Arsitektur Proyek & Folder Structure** | Menentukan arsitektur berbasis fitur (*feature-first* / layered architecture: `core`, `features`, `widgets`), memilih package dependency. | Merekomendasikan struktur hirarki file standar Flutter. |
| **Desain Sistem & Brand Identity** | Menentukan palet warna dari logo utama (`#161A29`, `#135CE2`, `#23B26D`, `#F99E15`), menolak latar putih polos dan meminta latar *soft slate-blue* (`#EFF3FA`). | Mengenerate kelas konstanta warna (`AppColors`) dan `AppTextStyles`. |
| **Latihan Mandiri & Simulasi CBT** | Merancang logika interaktif seleksi opsi jawaban (A/B/C/D), alur navigasi soal, dan mekanisme toggle penjelasan jawaban. | Membantu penyusunan widget visual soal, opsi radio card, dan progress bar timer. |
| **Portal Guru & Pantauan Siswa** | Menentukan kebutuhan data pantauan (status kompeten, indikator remedial, Live Monitor ujian, dan sinkronisasi Dapodik). | Menghasilkan struktur card analitik dan listview asesi. |
| **Validasi & Foto Profil Berbasis Gender** | Mengarahkan integrasi aset foto profil default sesuai jenis kelamin (`pp_default_laki-laki.jpg` & `pp_default_perempuan.jpg`) menggantikan placeholder icon/logo. | Menyesuaikan binding `AssetImage` pada `CircleAvatar`. |
| **Debugging & Quality Assurance** | Menguji fungsionalitas, mengevaluasi lint issue dengan `flutter analyze`, serta memastikan zero error & zero warning. | Memberikan saran perbaikan konstanta (`const`) dan pembersihan *unused fields*. |

---

## 3. Studi Kasus Prompting & Evaluasi Kritis

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

## 4. Rencana Target Fitur Menuju Akhir Semester (UAS)
1. **Integrasi Backend API (RESTful API):** Menghubungkan modul autentikasi NISN/NIP, pengambilan bank soal, dan pengiriman rekap nilai ke server database terpusat.
2. **Penyimpanan Lokal Persisten (SQLite / Isar / Drift):** Menyempurnakan fitur *Offline-First* agar seluruh riwayat pengerjaan soal dan cache paket materi tersimpan permanen di perangkat lokal mahasiswa saat tidak ada sinyal.
3. **Fitur Presensi / Validasi QR Code CBT Lab:** Menambahkan scanner kamera untuk memindai kode QR workstation lab komputer saat ujian simulasi UKK berlangsung.
