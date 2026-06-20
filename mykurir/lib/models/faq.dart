class Faq {
  final String? idFaq;
  final String? pertanyaan;
  final String? jawaban;
  final int? likes;
  final int? dislikes;
  final DateTime? createdAt;

  Faq({
    this.idFaq,
    this.pertanyaan,
    this.jawaban,
    this.likes,
    this.dislikes,
    this.createdAt,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      idFaq: json['id_faq'] as String?,
      pertanyaan: json['pertanyaan'] as String?,
      jawaban: json['jawaban'] as String?,
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_faq': idFaq,
      'pertanyaan': pertanyaan,
      'jawaban': jawaban,
      'likes': likes,
      'dislikes': dislikes,
      'created_at': createdAt?.toIso8601String(),
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
