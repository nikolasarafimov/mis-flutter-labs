import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:exam_schedule/screens/home.dart';
import 'package:exam_schedule/screens/details.dart';
import 'package:exam_schedule/models/exam_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('mk_MK', null);
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Распоред на испити',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) {
          final exam = ModalRoute.of(context)!.settings.arguments as Exam;
          return ExamDetailsScreen(exam: exam);
        },
      },
    );
  }
}