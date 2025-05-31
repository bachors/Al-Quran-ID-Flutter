import 'package:flutter/material.dart';

// Page
import 'src/views/pages/surah.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Quran ID',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SurahPage(),
    );
  }
}