class RatingAplikasi {
  final String? idRatingAplikasi;
  final double? skor;
  final String? pesan;
  final DateTime? createdAt;
  final String? idAkun;

  RatingAplikasi({
    this.idRatingAplikasi,
    this.skor,
    this.pesan,
    this.createdAt,
    this.idAkun,
  });

  factory RatingAplikasi.fromJson(Map<String, dynamic> json) {
    return RatingAplikasi(
      idRatingAplikasi: json['id_rating_aplikasi'] as String?,
      skor: (json['skor'] as num?)?.toDouble(),
      pesan: json['pesan'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      idAkun: json['id_akun'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_rating_aplikasi': idRatingAplikasi,
      'skor': skor,
      'pesan': pesan,
      'created_at': createdAt?.toIso8601String(),
      'id_akun': idAkun,
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
