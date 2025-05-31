import 'ayah.dart';

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