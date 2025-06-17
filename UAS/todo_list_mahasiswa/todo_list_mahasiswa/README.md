# To-Do List Mahasiswa

Aplikasi Flutter untuk mengelola tugas-tugas mahasiswa dengan fitur lengkap dan integrasi Firebase Realtime Database.

## Fitur Utama

### ✅ Fitur Wajib
- **Tambah Tugas**: Form input dengan judul tugas, deadline, dan kategori (Kuliah, Organisasi, Pribadi)
- **Checklist Selesai**: User dapat mencentang tugas yang sudah selesai
- **Filter Kategori**: Filter tugas berdasarkan kategori
- **Simpan ke Firebase**: Data tersimpan di Firebase Realtime Database
- **CRUD Lengkap**: Create, Read, Update, Delete tugas

### 🎯 Fitur Bonus
- **Gambar Pendukung**: Kamera/pilih file untuk foto detail tugas
- **Gambar Static**: Gambar default otomatis berdasarkan kategori
- **UI Responsif**: Desain yang mengikuti mockup Figma
- **Edit Tugas**: Fitur edit tugas yang sudah ada
- **Detail Tugas**: Halaman detail dengan informasi lengkap

## Struktur Proyek

```
lib/
├── main.dart                    # Entry point aplikasi
├── models/
│   └── task.dart               # Model data Task
├── screens/
│   ├── home_screen.dart        # Halaman utama dengan daftar tugas
│   ├── add_task_screen.dart    # Halaman tambah tugas
│   ├── task_detail_screen.dart # Halaman detail tugas
│   └── edit_task_screen.dart   # Halaman edit tugas
├── widgets/
│   └── task_card.dart          # Widget card untuk menampilkan tugas
└── services/
    ├── task_service.dart       # Service untuk operasi CRUD
    └── static_image_service.dart # Service untuk gambar static
```

## Dependencies

- `firebase_core`: ^2.24.2 - Core Firebase
- `firebase_database`: ^10.4.0 - Firebase Realtime Database
- `image_picker`: ^1.0.4 - Picker gambar dari kamera/galeri
- `intl`: ^0.19.0 - Format tanggal
- `provider`: ^6.1.1 - State management

## Setup Firebase

1. Buat project baru di [Firebase Console](https://console.firebase.google.com/)
2. Aktifkan Realtime Database
3. Update konfigurasi Firebase di `lib/main.dart`:

```dart
await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "your-api-key",
    authDomain: "your-project.firebaseapp.com",
    databaseURL: "https://your-project-default-rtdb.firebaseio.com/",
    projectId: "your-project-id",
    storageBucket: "your-project.appspot.com",
    messagingSenderId: "123456789",
    appId: "your-app-id",
  ),
);
```

## Cara Menjalankan

1. Clone repository ini
2. Jalankan `flutter pub get` untuk menginstall dependencies
3. Setup Firebase sesuai petunjuk di atas
4. Jalankan `flutter run` untuk menjalankan aplikasi

## Fitur Aplikasi

### Halaman Utama (Home)
- Menampilkan daftar semua tugas
- Filter berdasarkan kategori (All, Kuliah, Organisasi, Pribadi)
- Checkbox untuk menandai tugas selesai
- Floating Action Button untuk menambah tugas baru

### Halaman Tambah Data
- Form input judul tugas
- Dropdown kategori
- Date picker untuk deadline
- Text area untuk deskripsi (opsional)
- Image picker untuk gambar pendukung
- Gambar static otomatis jika tidak ada gambar yang dipilih

### Halaman Detail
- Informasi lengkap tugas
- Status completion
- Gambar pendukung (static atau dari user)
- Tombol toggle status selesai
- Menu edit dan hapus tugas

### Halaman Edit
- Form yang sama dengan tambah data
- Pre-filled dengan data tugas yang ada
- Opsi untuk mengubah atau menghapus gambar

## Teknologi

- **Flutter**: Framework UI
- **Firebase Realtime Database**: Database real-time
- **Provider**: State management
- **Image Picker**: Akses kamera dan galeri
- **Material Design**: Design system

## Kontributor

- **Nama Lengkap**: [Nama Mahasiswa]
- **NIM**: [NIM Mahasiswa]  
- **Kelas**: [Kelas Mahasiswa]
- **Nama Asprak**: [Nama Asisten Praktikum]

## Screenshots

Aplikasi ini mengimplementasikan desain dari Figma dengan 3 halaman utama:
1. Home - Daftar tugas dengan filter kategori
2. Input Data - Form tambah tugas dengan fitur kamera
3. Detail - Informasi lengkap tugas dengan opsi edit/hapus

## Catatan

- Aplikasi menggunakan gambar static sebagai fallback jika user tidak memilih gambar
- Data tersimpan secara real-time di Firebase
- UI responsif dan mengikuti Material Design guidelines
- Semua fitur CRUD telah diimplementasi dengan lengkap

