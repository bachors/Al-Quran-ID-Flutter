import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Quran App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SurahListScreen(),
    );
  }
}

class Surah {
  final String nomor;
  final String nama;
  final String asma;
  final int numberOfAyahs;
  final List<Ayah> ayat;
  final String type;
  final String urut;
  final String rukuk;
  final String arti;
  final String keterangan;
  final String audio;

  Surah({
    required this.nomor,
    required this.nama,
    required this.asma,
    required this.numberOfAyahs,
    required this.ayat,
    required this.type,
    required this.urut,
    required this.rukuk,
    required this.arti,
    required this.keterangan,
    required this.audio,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      nomor: json['nomor'],
      nama: json['nama'],
      asma: json['asma'],
      numberOfAyahs: json['ayat'].length,
      ayat: List<Ayah>.from(json["ayat"].map((x) => Ayah.fromJson(x))),
      type: json['type'],
      urut: json['urut'],
      rukuk: json['rukuk'],
      arti: json['arti'],
      keterangan: json['keterangan'],
      audio: json['audio'],
    );
  }
}

class Ayah {
  final String nomor;
  final String ar;
  final String tr;
  final String id;

  Ayah({
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.id,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      nomor: json['nomor'],
      ar: json['ar'],
      tr: json['tr'],
      id: json['id'],
    );
  }
}

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  _SurahListScreenState createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  List<Surah> surahs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSurahs();
  }

  Future<void> fetchSurahs() async {
    final String jsonString = await rootBundle.loadString('data.json');
    List jsonResponse = jsonDecode(jsonString);
    setState(() {
      surahs = jsonResponse.map((data) => Surah.fromJson(data)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Al-Quran')),
      body:
      isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return ListTile(
            leading: CircleAvatar(child: Text(surah.nomor)),
            title: Text(
                surah.asma,
                textAlign: TextAlign.end
            ),
            subtitle: Text(
              '${surah.nama}\n${surah.arti}\n${surah.type}\n${surah.numberOfAyahs} Ayat',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurahDetailScreen(surah: surah),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SurahDetailScreen extends StatelessWidget {
  final Surah surah;

  const SurahDetailScreen({super.key, required this.surah});

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
