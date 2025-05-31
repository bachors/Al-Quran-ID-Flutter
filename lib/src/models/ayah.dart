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