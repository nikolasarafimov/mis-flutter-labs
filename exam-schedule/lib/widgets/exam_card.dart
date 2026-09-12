import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  String _formatDate(DateTime dt) {
    return DateFormat('dd.MM.yyyy (EEE) • HH:mm', 'mk_MK').format(dt);
  }

  Widget _roomsChips(List<String> rooms) {
    return Wrap(
      spacing: 8,
      children: rooms.map((r) => Chip(label: Text('Просторија $r'))).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor:
                isPast ? Colors.grey.shade300 : Colors.blue.shade100,
                child: Icon(
                  isPast ? Icons.history : Icons.school,
                  color: isPast ? Colors.grey.shade700 : Colors.blue.shade700,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.subject,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(exam.dateTime),
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 6),
                    _roomsChips(exam.classrooms),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}