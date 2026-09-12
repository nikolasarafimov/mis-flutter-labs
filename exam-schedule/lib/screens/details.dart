import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({super.key, required this.exam});

  String _formatDate(DateTime dt) {
    return DateFormat('dd.MM.yyyy (EEEE), HH:mm', 'mk_MK').format(dt);
  }

  String _remainingHuman(Duration diff, {bool past = false}) {
    var d = diff.inDays;
    var h = diff.inHours - d * 24;
    d = d.abs();
    h = h.abs();
    final base = '$d дена, $h часа';
    return past ? 'Испитот е поминат пред $base' : 'Преостанува: $base';
  }

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;
    final diff = isPast ? DateTime.now().difference(exam.dateTime) : exam.dateTime.difference(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text('Детален преглед на испит')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      isPast ? Icons.history : Icons.event_available,
                      size: 32,
                      color: isPast ? Colors.grey : Colors.green,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        exam.subject,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _itemWithIcon(Icons.calendar_today, 'Датум и време', _formatDate(exam.dateTime)),
                const SizedBox(height: 8),
                _itemWithIcon(Icons.location_on, 'Простории', exam.classrooms.join(', ')),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isPast ? Colors.grey.shade200 : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _remainingHuman(diff, past: isPast),
                    style: TextStyle(
                      fontSize: 16,
                      color: isPast ? Colors.grey.shade800 : Colors.blue.shade800,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemWithIcon(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title:',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }
}