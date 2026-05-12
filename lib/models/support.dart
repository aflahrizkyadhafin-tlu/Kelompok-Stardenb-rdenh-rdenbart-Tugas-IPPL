class Support {
  final String idSupport;
  final String pertanyaan;
  final String jawaban;
  final int goodScore;
  final int badScore;
  final String idAkun;

  Support({
    required this.idSupport,
    required this.pertanyaan,
    required this.jawaban,
    required this.goodScore,
    required this.badScore,
    required this.idAkun,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      idSupport: json['id_support'] ?? '',
      pertanyaan: json['pertanyaan'] ?? '',
      jawaban: json['jawaban'] ?? '',
      goodScore: json['good_score'] is int
          ? json['good_score']
          : int.parse(json['good_score'].toString()),
      badScore: json['bad_score'] is int
          ? json['bad_score']
          : int.parse(json['bad_score'].toString()),
      idAkun: json['id_akun'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_support': idSupport,
      'pertanyaan': pertanyaan,
      'jawaban': jawaban,
      'good_score': goodScore,
      'bad_score': badScore,
      'id_akun': idAkun,
    };
  }
}
