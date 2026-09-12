import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_card.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Exam> _exams;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();

    _exams = [
      Exam(
        subject: 'Математика 1',
        dateTime: DateTime(now.year, now.month, 7, 9, 0),
        classrooms: ['200а', '200б'],
      ),
      Exam(
        subject: 'Структурно програмирање',
        dateTime: DateTime(now.year, now.month, 7, 12, 30),
        classrooms: ['215'],
      ),
      Exam(
        subject: 'Роботика',
        dateTime: DateTime(now.year, now.month, 11, 10, 15),
        classrooms: ['13'],
      ),
      Exam(
        subject: 'Интернет програмирање',
        dateTime: DateTime(now.year, now.month, 13, 14, 0),
        classrooms: ['117'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateTime: DateTime(now.year, now.month, 13, 17, 30),
        classrooms: ['2', '3'],
      ),
      Exam(
        subject: 'Веројатност и статистика',
        dateTime: DateTime(now.year, now.month, 16, 15, 0),
        classrooms: ['Амфитеатар ФИНКИ'],
      ),
      Exam(
        subject: 'Електроника',
        dateTime: DateTime(now.year, now.month, 18, 17, 0),
        classrooms: ['12'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(now.year, now.month, 19, 15, 45),
        classrooms: ['315'],
      ),
      Exam(
        subject: 'Компјутерски мрежи',
        dateTime: DateTime(now.year, now.month, 20, 9, 0),
        classrooms: ['Б1'],
      ),
      Exam(
        subject: 'Мобилни информациски системи',
        dateTime: DateTime(now.year, now.month, 21, 14, 0),
        classrooms: ['Б3.2'],
      ),
      Exam(
        subject: 'Архитектура на компјутери',
        dateTime: DateTime(now.year, now.month, 24, 18, 30),
        classrooms: ['Б3.3'],
      ),
    ];

    _exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  String _appBarTitle() => 'Распоред за испити — 223091';

  @override
  Widget build(BuildContext context) {
    final toShow = _exams.take(10).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: toShow.length,
              itemBuilder: (context, index) {
                final exam = toShow[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamDetailsScreen(exam: exam),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue.shade50,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Вкупно испити: ${_exams.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}