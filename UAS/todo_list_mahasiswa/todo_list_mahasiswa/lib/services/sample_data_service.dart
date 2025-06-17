
import '../models/task.dart';
import '../services/static_image_service.dart';

class SampleDataService {
  static List<Task> getSampleTasks() {
    final now = DateTime.now();
    
    return [
      Task(
        id: '1',
        title: 'Tugas Pemrogramgan Bergerak',
        category: 'Kuliah',
        deadline: now.add(const Duration(days: 3)),
        description: 'Membuat aplikasi Flutter To-Do List dengan Firebase',
        imagePath: StaticImageService.getStaticImageByCategory('Kuliah'),
        isCompleted: false,
      ),
      Task(
        id: '2',
        title: 'Rapat Organisasi Mahasiswa',
        category: 'Organisasi',
        deadline: now.add(const Duration(days: 1)),
        description: 'Rapat koordinasi kegiatan semester ini',
        imagePath: StaticImageService.getStaticImageByCategory('Organisasi'),
        isCompleted: false,
      ),
      Task(
        id: '3',
        title: 'Belajar untuk UTS',
        category: 'Kuliah',
        deadline: now.add(const Duration(days: 7)),
        description: 'Persiapan UTS mata kuliah Basis Data',
        imagePath: StaticImageService.getStaticImageByCategory('Kuliah'),
        isCompleted: true,
      ),
      Task(
        id: '4',
        title: 'Membeli Buku Referensi',
        category: 'Pribadi',
        deadline: now.add(const Duration(days: 2)),
        description: 'Beli buku untuk tugas akhir',
        imagePath: StaticImageService.getStaticImageByCategory('Pribadi'),
        isCompleted: false,
      ),
    ];
  }
}

