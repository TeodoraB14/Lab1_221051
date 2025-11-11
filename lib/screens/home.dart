import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Exam> exams = [
    Exam(predmet: "Вовед во науката за податоци", datum_i_vreme: DateTime(2025, 12, 25, 9, 0), prostorii: ["Лаб 13", "Лаб 2"]),
    Exam(predmet: "Мобилни информациски системи", datum_i_vreme: DateTime(2025, 11, 15, 10, 30), prostorii: ["Б2.2"]),
    Exam(predmet: "Интегрирани системи", datum_i_vreme: DateTime(2025, 2, 1, 12, 0), prostorii: ["Б3.1", "Лаб 138"]),
    Exam(predmet: "Бази на податоци", datum_i_vreme: DateTime(2026, 2, 5, 11, 0), prostorii: ["Лаб 3, Лаб 215"]),
    Exam(predmet: "Оперативни системи", datum_i_vreme: DateTime(2026, 1, 22, 9, 30), prostorii: ["Лаб 117, Б1"]),
    Exam(predmet: "Компјутерски мрежи", datum_i_vreme: DateTime(2025, 12, 29, 8, 0), prostorii: ["Лаб 2, Лаб 315, Лаб 138"]),
    Exam(predmet: "Софтверско инженерство", datum_i_vreme: DateTime(2025, 3, 20, 10, 0), prostorii: ["Б2.3, Лаб 13"]),
    Exam(predmet: "Веб програмирање", datum_i_vreme: DateTime(2025, 2, 25, 13, 0), prostorii: ["Лаб 117, Лаб АБ"]),
    Exam(predmet: "Вештачка интелигенција", datum_i_vreme: DateTime(2026, 1, 17, 9, 0), prostorii: ["Б3.2"]),
    Exam(predmet: "Дизајн и архитектура на софтвер", datum_i_vreme: DateTime(2025, 12, 26, 14, 0), prostorii: ["Лаб 3, Лаб 215"]),
    Exam(predmet: "Веројатност и статистика", datum_i_vreme: DateTime(2025, 12, 23, 13, 0), prostorii: ["Лаб 117, Лаб АБ"]),
    Exam(predmet: "Алгоритми и податочни структури", datum_i_vreme: DateTime(2025, 12, 28, 9, 20), prostorii: ["Лаб 117, Лаб АБ"]),
    Exam(predmet: "Софтверски квалитет и тестирање", datum_i_vreme: DateTime(2026, 02, 02, 10, 0), prostorii: ["Лаб 117, Лаб АБ"]),

  ];
  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.datum_i_vreme.compareTo(b.datum_i_vreme));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 221051",
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.brown,
        centerTitle: true,
        toolbarHeight: 100,

      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ExamCard(exam: exams[index]);
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.brown[400],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

