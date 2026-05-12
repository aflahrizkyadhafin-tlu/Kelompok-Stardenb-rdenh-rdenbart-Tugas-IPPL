class RatingKurir {
  final String idRating;
  final double rating;
  final String pesan;
  final String idPelanggan;
  final String idKurir;

  RatingKurir({
    required this.idRating,
    required this.rating,
    required this.pesan,
    required this.idPelanggan,
    required this.idKurir,
  });

  factory RatingKurir.fromJson(Map<String, dynamic> json) {
    return RatingKurir(
      idRating: json['idRating'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      pesan: json['pesan'] ?? '',
      idPelanggan: json['idPelanggan'] ?? '',
      idKurir: json['idKurir'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRating': idRating,
      'rating': rating,
      'pesan': pesan,
      'idPelanggan': idPelanggan,
      'idKurir': idKurir,
    };
  }
}
