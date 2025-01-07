# Tugu Phantom - Dorking Unlimited

## Deskripsi
**Tugu Phantom - Dorking Unlimited** adalah tools berbasis Bash untuk melakukan pencarian dork tanpa batas menggunakan Google Custom Search Engine (CSE). Tools ini dirancang untuk membantu peneliti keamanan siber dalam proses pengumpulan informasi melalui dorking secara efisien dan otomatis.

Fitur utama tools ini meliputi:
- Auto Dorking untuk dork spesifik.
- Pemrosesan daftar dork dari file eksternal.
- Paginasi untuk mendapatkan hasil tanpa batas.
- Penyimpanan hasil otomatis dalam file teks.

## Fitur Utama
- **Auto Dorking**: Masukkan satu dork dan dapatkan hasilnya secara langsung.
- **Pemrosesan Daftar Dork**: Masukkan file yang berisi daftar dork untuk diproses secara batch.
- **Paginasi Hasil**: Ambil semua hasil pencarian tanpa batasan jumlah.
- **Penyimpanan Otomatis**: Simpan hasil ke file teks dengan nama dinamis.

## Cara Instalasi
1. Clone repository ini ke perangkat Anda:
   ```bash
   git clone https://github.com/TuguPhantom/tugu-phantom-dorking.git
   cd tugu-phantom-dorking
   ```

2. Berikan izin eksekusi pada script:
   ```bash
   chmod +x dorking_unlimited.sh
   ```

3. Jalankan script:
   ```bash
   ./dorking_unlimited.sh
   ```

## Penggunaan
### Menu Utama
Saat menjalankan tools, Anda akan melihat menu berikut:
```
[1] Auto Dorking
[2] Gunakan Daftar Anda Sendiri
```

#### Opsi 1: Auto Dorking
1. Pilih opsi `1`.
2. Masukkan dork yang ingin Anda gunakan.
3. Tools akan mengambil hasil pencarian dan menyimpannya ke file teks.

#### Opsi 2: Gunakan Daftar Anda Sendiri
1. Pilih opsi `2`.
2. Masukkan path file yang berisi daftar dork.
3. Tools akan memproses setiap dork dalam file secara berurutan dan menyimpan hasilnya ke file teks.

## Contoh Hasil
Setelah menjalankan tools, Anda akan mendapatkan hasil dalam format berikut:
```
https://example1.com
https://example2.com
...
```
Hasil ini akan disimpan dalam file teks dengan nama seperti `hasil_dorking_YYYYMMDDHHMMSS.txt`.

## Catatan
- Tools ini membutuhkan koneksi internet untuk mengakses Google CSE.
- Pastikan format file dork (untuk opsi 2) berisi satu dork per baris.

## Pengembangan di Masa Depan
- Penambahan dukungan untuk mesin pencari lain seperti Bing, Yahoo, DuckDuckGo, dan Yandex.
- Format output tambahan dalam JSON atau CSV.
- Integrasi untuk analisis hasil otomatis.

## Kontribusi
Kontribusi selalu diterima! Silakan buat pull request atau laporkan issue jika Anda menemukan masalah.

## Lisensi
Proyek ini dilisensikan di bawah [MIT License](LICENSE).

## Penulis
- **Tugu Phantom**
