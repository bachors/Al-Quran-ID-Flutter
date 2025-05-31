import 'package:alquran_id/src/views/pages/ayah.dart';
import 'package:flutter/material.dart';

// Model
import '../../models/surah.dart';

class MyList extends StatelessWidget {
  final Surah surah;
  const MyList({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: surah.nomor,
              child: CircleAvatar(child: Text(surah.nomor)),
            ),
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
                  builder: (context) => AyahPage(surah: surah),
                ),
              );
            },
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}