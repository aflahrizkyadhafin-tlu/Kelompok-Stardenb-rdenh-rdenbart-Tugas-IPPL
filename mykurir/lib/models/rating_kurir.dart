class RatingKurir {
  String? idRating;
  double? rating;
  String? pesan;
  DateTime? createdAt;
  String? idAkun;
  String? idKurir;
  String? idPengiriman;

  RatingKurir({
    this.idRating,
    this.rating,
    this.pesan,
    this.createdAt,
    this.idAkun,
    this.idKurir,
    this.idPengiriman,
  });

  factory RatingKurir.fromJson(Map<String, dynamic> json) {
    return RatingKurir(
      idRating: json['id_rating'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      pesan: json['pesan'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      idAkun: json['id_akun'] as String?,
      idKurir: json['id_kurir'] as String?,
      idPengiriman: json['id_pengiriman'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_rating': idRating,
      'rating': rating,
      'pesan': pesan,
      'created_at': createdAt?.toIso8601String(),
      'id_akun': idAkun,
      'id_kurir': idKurir,
      'id_pengiriman': idPengiriman,
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
