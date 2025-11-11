
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Распоред за испити - 221051',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal[300],
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: HomeScreen(),
    );
  }
}




