class Admin {
  final String idAdmin;
  final String idAkun;

  Admin({required this.idAdmin, required this.idAkun});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      idAdmin: json["id_admin"] ?? '',
      idAkun: json["id_akun"] ?? '',
    );
  }

  Map<String, dynamic> toJson(String idAdmin, idAkun) {
    return {"id_admin": idAdmin, "id_akun": idAkun};
  }
}
