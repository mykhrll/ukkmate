# Aturan Otomatisasi Commit & Kenaikan Versi (Auto Commit & Version Bump)

Setiap kali asisten melakukan perbaikan, penambahan fitur, atau penyelesaian progres untuk proyek UKKMate:
1. **Otomatis Ubah Versi Aplikasi**:
   - Selalu naikkan versi di `pubspec.yaml` (misal `version: 0.1.x+y`).
   - Sesuaikan tampilan nomor versi di antarmuka pengguna (`lib/features/profile/profile_screen.dart`, `lib/features/guru/guru_pengaturan_screen.dart`, dan `README.md`).
2. **Validasi Kualitas Kode**:
   - Pastikan `flutter analyze` lulus tanpa error.
   - Pastikan pengujian `flutter test` lulus.
3. **Otomatis Git Commit & Push ke GitHub**:
   - Stage perubahan yang relevan dengan `git add .`
   - Buat commit dengan format deskriptif: `feat(v...): <penjelasan fitur/perbaikan>` atau `fix(v...): <penjelasan perbaikan>`.
   - Lakukan `git push origin <current_branch>` secara otomatis tanpa harus diminta ulang.
