import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/task_detail_screen.dart';
import 'services/task_service.dart';
import 'models/task.dart';

/*
Nama Lengkap: MOH MUCHLIS
NIM: 230441100147
Kelas: PEMBER C
Nama Asprak: KAK DHEA
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDgZJbxxx",
      authDomain: "todo-app.firebaseapp.com",
      databaseURL: "https://todo-app-default-rtdb.firebaseio.com",
      projectId: "todo-app",
      storageBucket: "todo-app.appspot.com",
      messagingSenderId: "9876543210",
      appId: "1:9876543210:web:abcd1234efgh5678",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final taskService = TaskService();
        taskService.initializeListener();
        return taskService;
      },
      child: MaterialApp(
        title: 'To-Do List Mahasiswa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2E3A59),
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
        ),
        home: const HomeScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/detail':
              final task = settings.arguments as Task;
              return MaterialPageRoute(
                builder: (context) => TaskDetailScreen(task: task),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
          }
        },
      ),
    );
  }
}
