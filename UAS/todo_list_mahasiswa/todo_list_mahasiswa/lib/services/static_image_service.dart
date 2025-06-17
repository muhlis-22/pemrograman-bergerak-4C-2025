import 'dart:math';

class StaticImageService {
  static final List<String> _staticImages = [
    'assets/images/study_books.jpg',
    'assets/images/notebook.jpg',
    'assets/images/student_writing.jpg',
  ];

  static String getRandomStaticImage() {
    final random = Random();
    return _staticImages[random.nextInt(_staticImages.length)];
  }

  static String getStaticImageByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'kuliah':
        return 'assets/images/study_books.jpg';
      case 'organisasi':
        return 'assets/images/student_writing.jpg';
      case 'pribadi':
        return 'assets/images/notebook.jpg';
      default:
        return getRandomStaticImage();
    }
  }

  static List<String> getAllStaticImages() {
    return List.from(_staticImages);
  }
}

