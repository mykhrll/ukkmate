# Aturan Otomatisasi Commit, Kenaikan Versi, & Dokumentasi (Auto Commit, Version Bump, & Docs)

Setiap kali asisten melakukan perbaikan, penambahan fitur, pemecahan bug, atau penyelesaian progres untuk proyek UKKMate:

1. **Otomatis Menaikkan Versi Aplikasi**:
   - Selalu naikkan versi di `pubspec.yaml` (misalnya `version: 0.1.x+y`).
   - Sesuaikan nomor versi di antarmuka pengguna:
     - `lib/features/profile/profile_screen.dart`
     - `lib/features/guru/guru_pengaturan_screen.dart`

2. **Otomatis Memperbarui Dokumentasi (`README.md` & `AI_DECLARATION.md`)**:
   - **`README.md`**:
     - Perbarui nomor versi di header aplikasi.
     - Tambahkan penjelasan fitur baru, perbaikan bug, atau penyesuaian teknis pada ringkasan fitur dan arsitektur direktori.
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
   - Lakukan `git push origin <current_branch>` secara otomatis tanpa harus diminta ulang.
