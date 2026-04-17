// Kelompok : Stardenbürdenhärdenbart
// Nama : Nadhif Ahnaf Fauzan
// NIM : 103112400236

import 'package:uuid/uuid.dart';

class RatingKurir {
  String idRating;
  double rating;
  String pesan;
  String idPelanggan;
  String idKurir;

  RatingKurir({
    String? idRating,
    required this.rating,
    required this.pesan,
    required this.idPelanggan,
    required this.idKurir,
  }) : idRating = idRating ?? const Uuid().v4() {
    if (rating < 0 || rating > 3) {
      throw ArgumentError('Rating harus berada di antara 0 dan 3.');
    }
  }

  void simpanRating() {
    print('Rating disimpan:');
    print('  ID Rating   : $idRating');
    print('  Rating      : $rating');
    print('  Pesan       : $pesan');
    print('  ID Pelanggan: $idPelanggan');
    print('  ID Kurir    : $idKurir');
  }

  static Map<String, double> hitungStatistik(List<RatingKurir> daftarRating) {
    if (daftarRating.isEmpty) {
      return {
        'jumlah': 0,
        'rata_rata': 0.0,
        'tertinggi': 0.0,
        'terendah': 0.0,
      };
    }

    double total = 0;
    double tertinggi = daftarRating.first.rating;
    double terendah = daftarRating.first.rating;

    for (var r in daftarRating) {
      total += r.rating;
      if (r.rating > tertinggi) tertinggi = r.rating;
      if (r.rating < terendah) terendah = r.rating;
    }

    return {
      'jumlah': daftarRating.length.toDouble(),
      'rata_rata': total / daftarRating.length,
      'tertinggi': tertinggi,
      'terendah': terendah,
    };
  }

  @override
  String toString() {
    return 'RatingKurir(idRating: $idRating, rating: $rating, pesan: $pesan, '
        'idPelanggan: $idPelanggan, idKurir: $idKurir)';
  }
}