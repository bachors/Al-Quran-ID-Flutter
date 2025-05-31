import 'package:flutter/material.dart';

// Model
import '../../models/surah.dart';

// Controller
import '../../controllers/data_controller.dart';

// Components
import '../components/list.dart';
import '../components/loading.dart';
import '../components/search.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final List<Surah> _surah = <Surah>[];
  List<Surah> _surahDisplay = <Surah>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSurah().then((value) {
      setState(() {
        _isLoading = false;
        _surah.addAll(value);
        _surahDisplay = _surah;
        // print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Quran ID'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? MySearch(
                hintText: 'Cari...',
                onChanged: (searchText) {
                  searchText = searchText.toLowerCase();
                  setState(() {
                    _surahDisplay = _surah.where((u) {
                      var nameLowerCase = u.nama.toLowerCase();
                      return nameLowerCase.contains(searchText);
                    }).toList();
                  });
                },
              )
                  : MyList(surah: _surahDisplay[index - 1]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _surahDisplay.length + 1,
        ),
      ),
    );
  }
}