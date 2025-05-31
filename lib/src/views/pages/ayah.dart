import 'package:flutter/material.dart';

// Model
import '../../models/surah.dart';

class AyahPage extends StatelessWidget {
  final Surah surah;

  const AyahPage({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surah.nama)),
      body: ListView.builder(
        itemCount: surah.ayat.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromRGBO(232, 247, 235, 1),
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    surah.ayat[index].ar,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(surah.ayat[index].id),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}