# AGENTS.md

## Tujuan repo
Proyek ini adalah aplikasi Flutter UKKMate. Setiap progress atau perubahan fitur harus tetap terdokumentasi, tervalidasi, dan tercatat di GitHub dengan riwayat commit yang berkelanjutan.

## Aturan yang wajib dipatuhi

1. Saat user meminta progress, update proyek harus dilakukan secara otomatis:
   - commit perubahan ke Git
   - update README.md jika ada perubahan fitur atau dokumentasi
   - update AI_DECLARATION.md jika ada perubahan teknis atau penggunaan AI
   - naikkan versi aplikasi di pubspec.yaml

2. Pola versioning yang dipakai:
   - Gunakan format `x.y.z+build`.
   - Jangan menaikkan langsung ke `.9` sebagai penutup minor.
   - Naikkan bertahap dalam minor yang sama sampai mencapai `0.2.99`.
   - Baru pindah ke `0.3.0` jika user secara eksplisit meminta naik versi minor berikutnya.
   - Contoh: `0.2.4 -> 0.2.5 -> ... -> 0.2.99 -> 0.3.0`.

3. Commit harus berstruktur dan berkala:
   - Gunakan pesan deskriptif seperti:
     - `feat(v0.2.5): tambah fitur ...`
     - `fix(v0.2.7): perbaiki bug ...`
     - `docs(v0.2.8): update README dan deklarasi AI`
   - Hindari commit satu besar tanpa kronologi yang jelas.

4. Dokumentasi wajib:
   - README.md harus berisi ringkasan aplikasi, screenshot, dan langkah menjalankan proyek.
   - AI_DECLARATION.md harus memuat daftar alat AI, pembagian peran, dan studi kasus prompting.

5. Validasi sebelum selesai:
   - jalankan `flutter analyze`
   - jalankan `flutter test`
   - pastikan tidak ada error yang signifikan sebelum laporan selesai

6. GitHub remote:
   - Repo yang aktif adalah https://github.com/mykhrll/ukkmate
   - Jika ada perubahan siap commit, push ke origin branch aktif secara otomatis.

## Prioritas
Jika user meminta progress tanpa instruksi spesifik, tetap lakukan:
- commit otomatis,
- update dokumentasi,
- increment versi secara bertahap,
- validasi proyek,
- dan kirim ringkasan hasil.
