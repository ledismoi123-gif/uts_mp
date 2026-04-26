# Aplikasi Login Flutter (Material App)

## Deskripsi Aplikasi

Aplikasi ini merupakan aplikasi mobile berbasis Flutter yang dikembangkan untuk memenuhi tugas mata kuliah Mobile Programming.

Aplikasi ini menyediakan sistem autentikasi sederhana menggunakan email dan password, dilengkapi dengan validasi input, fitur lupa password, serta halaman dashboard setelah proses login berhasil.

---

## Fitur Utama

* Login menggunakan email dan password
* Validasi format email
* Validasi password (minimal 8 karakter, kombinasi huruf dan angka)
* Menampilkan pesan error jika login gagal
* Fitur show/hide password
* Simulasi proses loading saat login
* Fitur lupa password (Forgot Password)
* Simulasi pengiriman link reset email
* Halaman dashboard setelah login berhasil
* Menampilkan email pengguna pada dashboard
* Navigasi antar halaman menggunakan route
* Fitur logout kembali ke halaman login

---

## Teknologi yang Digunakan

* Flutter (Dart)
* Material Design (MaterialApp, Scaffold, Card, Form, dll)
* Android Emulator atau perangkat fisik

---

## Cara Menjalankan Aplikasi

Pastikan perangkat telah terpasang Flutter SDK dan emulator atau device telah aktif.

Langkah-langkah:

```bash id="runformal"
git clone https://github.com/username/flutter-login-app.git
cd flutter-login-app
flutter pub get
flutter run
```

---

## Akun Login (Pengujian)

Gunakan akun berikut untuk mengakses aplikasi:

Email: [ledismoi123@gmail.com](mailto:ledismoi123@gmail.com)
Password: 12345678A

---

## Screenshot Aplikasi

### Halaman Login

![Login](assets/screenshots/login.png)

### Halaman Forgot Password

![Forgot](assets/screenshots/forgot.png)

### Halaman Dashboard

![Dashboard](assets/screenshots/dashboard.png)

Catatan: Pastikan file screenshot tersimpan pada direktori `assets/screenshots/`.

---

## Package yang Digunakan

Aplikasi ini hanya menggunakan package bawaan Flutter:

* flutter/material.dart

---

## Struktur Project

```id="strukturformal"
lib/
 ┗ main.dart
```

---

## Alur Aplikasi

1. Pengguna membuka aplikasi dan diarahkan ke halaman login
2. Pengguna memasukkan email dan password
3. Sistem melakukan validasi input
4. Jika data benar, pengguna diarahkan ke dashboard
5. Jika data salah, sistem menampilkan pesan error
6. Pengguna dapat mengakses fitur lupa password
7. Pengguna dapat logout dan kembali ke halaman login

---

## Repository

https://github.com/username/flutter-login-app

---

## Checklist Tugas

* Repository bersifat public atau telah di-invite kepada dosen
* Memiliki minimal 5 commit yang menunjukkan progress pengerjaan
* Menyediakan README.md lengkap
* Menyertakan minimal 3 screenshot aplikasi
* Aplikasi dapat dijalankan saat UTS

---

## Identitas Mahasiswa

Nama: Ledis Moi
NIM: [2401010192]
Mata Kuliah: Mobile Programming

---
