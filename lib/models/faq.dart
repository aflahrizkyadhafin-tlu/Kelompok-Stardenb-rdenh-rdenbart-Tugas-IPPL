class Faq {
  final String? idSupport;
  final String? pertanyaan;
  final String? jawaban;
  final int? likes;
  final int? dislikes;
  final DateTime? createdAt;

  Faq({
    this.idSupport,
    this.pertanyaan,
    this.jawaban,
    this.likes,
    this.dislikes,
    this.createdAt,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      idSupport: json['id_support'] as String,
      pertanyaan: json['pertanyaan'] as String,
      jawaban: json['jawaban'] as String,
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_support': idSupport,
      'pertanyaan': pertanyaan,
      'jawaban': jawaban,
      if (likes != null) 'likes': likes,
      if (dislikes != null) 'dislikes': dislikes,
      'created_at': createdAt?.toIso8601String(),
    };

    jsonData.removeWhere((key, value) => value == null || value == "");

    return jsonData;
  }
}
