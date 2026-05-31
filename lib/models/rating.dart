class RatingKurir {
  final String? idRating;
  final double? rating;
  final String? pesan;
  final DateTime? createdAt;
  final String? idPelanggan;
  final String? idKurir;
  final String? idPengiriman;

  RatingKurir({
    this.idRating,
    this.rating,
    this.pesan,
    this.createdAt,
    this.idPelanggan,
    this.idKurir,
    this.idPengiriman,
  });

  factory RatingKurir.fromJson(Map<String, dynamic> json) {
    return RatingKurir(
      idRating: json['id_rating'] as String,
      rating: (json['rating'] as num).toDouble(),
      pesan: json['pesan'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      idPelanggan: json['id_pelanggan'] as String,
      idKurir: json['id_kurir'] as String,
      idPengiriman: json['id_pengiriman'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_rating': idRating,
      'rating': rating,
      'pesan': pesan,
      'created_at': createdAt?.toIso8601String(),
      'id_pelanggan': idPelanggan,
      'id_kurir': idKurir,
      'id_pengiriman': idPengiriman,
    };

    jsonData.removeWhere(((key, value) => value == null || value == ""));

    return jsonData;
  }
}
