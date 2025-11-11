import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'package:intl/intl.dart';

import '../screens/exam_details.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy – HH:mm');
    final now = DateTime.now();

    final bool isPast = exam.datum_i_vreme.isBefore(now);

    final Color backgroundColor = isPast ? Colors.red[50]! : Colors.lightGreen[100]!;
    final Color textColor = isPast ? Colors.red[900]! : Colors.green[900]!;

    return Card(
      color: backgroundColor,
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailsScreen(exam: exam),
            ),
          );
        },

        leading: Icon(Icons.school, color: textColor, size: 35),
        title: Text(
          exam.predmet,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 21,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 5),
                Text(dateFormat.format(exam.datum_i_vreme),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,),
                ),

              ],
            ),
            const SizedBox(height: 3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(exam.prostorii.join(", "),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
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



// TODO Implement this library.