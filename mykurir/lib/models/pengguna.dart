class Pengguna {
  String? idPengguna;
  String? idAkun;
  DateTime? createdAt;

  Pengguna({this.idPengguna, this.idAkun, this.createdAt});

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
      idPengguna: json['id_pengguna'] as String?,
      idAkun: json['id_akun'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_pengguna': idPengguna,
      'id_akun': idAkun,
      'created_at': createdAt?.toIso8601String(),
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
