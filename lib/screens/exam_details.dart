import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy – HH:mm');
    final now = DateTime.now();

    final duration = exam.datum_i_vreme.difference(now);

    final bool isPast = duration.isNegative;

    final int days = duration.inDays.abs();
    final int hours = (duration.inHours.abs() % 24);

    final String timeText = isPast
        ? "Испитот е веќе одржан."
        : "$days дена и $hours часа до испитот.";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          exam.predmet,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
          backgroundColor: Colors.brown[400],
          centerTitle: true,
          toolbarHeight: 100,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Детали за испитот: ${exam.predmet}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  "Датум и време: ${dateFormat.format(exam.datum_i_vreme)}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.room, color: Colors.red[900]),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Простории: ${exam.prostorii.join(", ")}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.timer, color: Colors.black),
                const SizedBox(width: 10),
                Text(
                  timeText,
                  style: TextStyle(
                    fontSize: 18,
                    color: isPast ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
