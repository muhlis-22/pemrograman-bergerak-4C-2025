# Panduan Setup dan Penggunaan Aplikasi To-Do List Mahasiswa

## Informasi Proyek

**Aplikasi**: To-Do List Mahasiswa  
**Platform**: Flutter  
**Database**: Firebase Realtime Database  
**Fitur**: CRUD Tugas, Filter Kategori, Upload Gambar, UI Responsif

## Langkah-langkah Setup

### 1. Persiapan Environment

Pastikan Flutter SDK sudah terinstall di komputer Anda:
```bash
flutter --version
```

### 2. Clone dan Setup Proyek

```bash
# Clone repository (ganti dengan URL GitHub Anda)
git clone https://github.com/username/todo_list_mahasiswa.git
cd todo_list_mahasiswa

# Install dependencies
flutter pub get
```

### 3. Setup Firebase

1. **Buat Project Firebase**:
   - Kunjungi [Firebase Console](https://console.firebase.google.com/)
   - Klik "Add project" dan ikuti langkah-langkahnya
   - Berikan nama project, misalnya "todo-list-mahasiswa"

2. **Aktifkan Realtime Database**:
   - Di Firebase Console, pilih "Realtime Database"
   - Klik "Create Database"
   - Pilih "Start in test mode" untuk development
   - Pilih lokasi database (asia-southeast1 untuk Indonesia)

3. **Konfigurasi Flutter**:
   - Update file `lib/main.dart` dengan konfigurasi Firebase Anda:

```dart
await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "AIzaSyC...", // Ganti dengan API Key Anda
    authDomain: "todo-list-mahasiswa.firebaseapp.com",
    databaseURL: "https://todo-list-mahasiswa-default-rtdb.asia-southeast1.firebasedatabase.app/",
    projectId: "todo-list-mahasiswa",
    storageBucket: "todo-list-mahasiswa.appspot.com",
    messagingSenderId: "123456789",
    appId: "1:123456789:android:abc123def456",
  ),
);
```

### 4. Update Informasi Mahasiswa

Edit file `lib/main.dart` dan ganti komentar di bagian atas dengan informasi Anda:

```dart
/*
Nama Lengkap: [Nama Lengkap Anda]
NIM: [NIM Anda]
Kelas: [Kelas Anda]
Nama Asprak: [Nama Asisten Praktikum]
*/
```

### 5. Menjalankan Aplikasi

```bash
# Untuk Android
flutter run

# Untuk iOS (jika menggunakan Mac)
flutter run -d ios

# Untuk Web
flutter run -d chrome
```

## Fitur-fitur Aplikasi

### Halaman Utama (Home)
- **Daftar Tugas**: Menampilkan semua tugas dalam bentuk card
- **Filter Kategori**: Dropdown untuk filter berdasarkan kategori (All, Kuliah, Organisasi, Pribadi)
- **Checkbox**: Tap untuk menandai tugas selesai/belum selesai
- **Tambah Tugas**: Floating Action Button (+) untuk menambah tugas baru

### Halaman Tambah Data
- **Judul Tugas**: Input wajib untuk nama tugas
- **Kategori**: Dropdown pilihan (Kuliah, Organisasi, Pribadi)
- **Deadline**: Date picker untuk memilih tanggal deadline
- **Deskripsi**: Text area opsional untuk detail tugas
- **Gambar**: Pilih dari kamera atau galeri (otomatis menggunakan gambar static jika tidak dipilih)

### Halaman Detail Tugas
- **Informasi Lengkap**: Menampilkan semua detail tugas
- **Status**: Indikator selesai/belum selesai
- **Gambar**: Menampilkan gambar pendukung
- **Aksi**: Toggle status, edit, atau hapus tugas

### Halaman Edit Tugas
- **Form Edit**: Sama dengan form tambah data tapi pre-filled
- **Update Data**: Simpan perubahan ke Firebase
- **Ubah Gambar**: Opsi untuk mengganti atau menghapus gambar

## Struktur Database Firebase

Data disimpan dalam struktur berikut di Realtime Database:

```json
{
  "tasks": {
    "task_id_1": {
      "id": "task_id_1",
      "title": "Tugas Pemrograman Bergerak",
      "category": "Kuliah",
      "deadline": 1703980800000,
      "description": "Membuat aplikasi Flutter",
      "imagePath": "assets/images/study_books.jpg",
      "isCompleted": false
    }
  }
}
```

## Troubleshooting

### Error: Firebase not initialized
- Pastikan `Firebase.initializeApp()` dipanggil di `main()` function
- Periksa konfigurasi Firebase Options

### Error: Image not loading
- Untuk gambar dari kamera/galeri: Periksa permission di Android/iOS
- Untuk gambar static: Pastikan file ada di folder `assets/images/`

### Error: Dependencies conflict
```bash
flutter clean
flutter pub get
```

### Error: Build failed
```bash
flutter doctor
# Ikuti saran untuk memperbaiki issues
```

## Upload ke GitHub

1. **Inisialisasi Git**:
```bash
git init
git add .
git commit -m "Initial commit: To-Do List Mahasiswa Flutter App"
```

2. **Buat Repository di GitHub**:
   - Kunjungi [GitHub](https://github.com)
   - Klik "New repository"
   - Nama: `todo_list_mahasiswa`
   - Pilih "Public" atau "Private"

3. **Push ke GitHub**:
```bash
git remote add origin https://github.com/username/todo_list_mahasiswa.git
git branch -M main
git push -u origin main
```

## Pengumpulan Tugas

Setelah proyek selesai dan di-upload ke GitHub:

1. **Pastikan README.md lengkap** dengan informasi proyek
2. **Test aplikasi** untuk memastikan semua fitur berfungsi
3. **Screenshot aplikasi** untuk dokumentasi
4. **Copy link GitHub repository** untuk pengumpulan
5. **Submit link GitHub** di form pengumpulan yang disediakan

## Catatan Penting

- **Jangan commit file konfigurasi Firebase** yang berisi API keys
- **Test di device fisik** untuk fitur kamera
- **Pastikan internet connection** untuk Firebase
- **Backup project** sebelum melakukan perubahan besar

## Kontak Support

Jika mengalami kesulitan, hubungi:
- **Asisten Praktikum**: [Nama Asprak]
- **Email**: [email@domain.com]
- **Jam Konsultasi**: [Jadwal konsultasi]

