# Aturan Otomatisasi Commit, Kenaikan Versi, & Dokumentasi (Auto Commit, Version Bump, & Docs)

Setiap kali asisten melakukan perbaikan, penambahan fitur, pemecahan bug, atau penyelesaian progres untuk proyek UKKMate:

1. **Otomatis Menaikkan Versi Aplikasi**:
   - Selalu naikkan versi di `pubspec.yaml`.
   - Pola versi yang dipakai adalah `x.y.z+build`, dengan aturan khusus:
     - Jangan loncat langsung ke `.9` untuk menutup minor.
     - Naikkan bertahap di dalam minor yang sama sampai mencapai `0.2.99`, lalu baru naik ke `0.3.0` ketika user secara eksplisit meminta kenaikan minor atau versi rilis berikutnya.
     - Contoh yang benar: `0.2.4 -> 0.2.5 -> ... -> 0.2.99 -> 0.3.0`.
     - Jika user tidak memberi instruksi untuk naik ke minor baru, tetap lanjut dalam minor saat ini dan jangan langsung ke `0.3.0`.
   - Sesuaikan nomor versi di antarmuka pengguna jika relevan:
     - `lib/features/profile/profile_screen.dart`
     - `lib/features/guru/guru_pengaturan_screen.dart`

2. **Otomatis Memperbarui Dokumentasi (`README.md` & `AI_DECLARATION.md`)**:
   - **`README.md`**:
     - Perbarui nomor versi di header aplikasi.
     - Tambahkan penjelasan fitur baru, perbaikan bug, atau penyesuaian teknis pada ringkasan fitur dan arsitektur direktori.
     - Pastikan dokumen tetap memuat ringkasan aplikasi, screenshot, dan langkah menjalankan proyek.
   - **`AI_DECLARATION.md`**:
     - Perbarui baris tabel linimasa rilis versi dengan nomor versi dan fokus rilis terbaru.
     - Tambahkan sub-bagian rincian implementasi pada periode terkait.
     - Catat studi kasus prompting atau evaluasi kritis teknis jika terdapat perbaikan galat.

3. **Validasi Kualitas Kode & Pengujian**:
   - Jalankan `flutter analyze` dan pastikan lulus tanpa error (`0 issues`).
   - Jalankan `flutter test` dan pastikan seluruh test suite lulus (`All tests passed!`).

4. **Otomatis Git Commit & Push ke GitHub**:
   - Stage seluruh perubahan dengan `git add -A`.
   - Buat commit dengan pesan format deskriptif: `feat(v...): <fitur>` atau `fix(v...): <perbaikan>` atau `docs(v...): <dokumentasi>`.
   - Lakukan `git push origin <current_branch>` secara otomatis tanpa harus diminta ulang, asalkan project dalam kondisi siap untuk dipush.
   - Jaga riwayat commit agar tetap bertahap dan berkelanjutan, bukan satu commit besar yang tidak terdokumentasi.

5. **Kebijakan Prioritas UTS / Progres**:
   - Saat user meminta progress, asisten wajib memperbarui code, dokumentasi, dan versi aplikasi secara otomatis.
   - Jika user hanya meminta update progres tanpa instruksi spesifik, tetap lakukan commit dan update versi secara bertahap sesuai ketentuan di atas.
   - Jika user memberi instruksi eksplisit untuk naik ke versi minor baru, barulah lakukan kenaikan dari `0.2.99` menjadi `0.3.0` atau seterusnya.
