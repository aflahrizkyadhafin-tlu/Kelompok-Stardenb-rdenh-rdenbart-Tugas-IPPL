class Akun {
  final String? idAkun;
  final String? username;
  final String? namaLengkap;
  final String? alamat;
  final String? fotoProfile;

  Akun({
    this.idAkun,
    this.username,
    this.namaLengkap,
    this.alamat,
    this.fotoProfile,
  });

  factory Akun.fromJson(Map<String, dynamic> json) {
    return Akun(
      idAkun: json["id_akun"],
      username: json["username"],
      namaLengkap: json["nama_lengkap"],
      alamat: json["alamat"],
      fotoProfile: json["foto_profile"],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {
      "id_akun": idAkun,
      "username": username,
      "nama_lengkap": namaLengkap,
      "alamat": alamat,
      "foto_profile": fotoProfile,
    };

    jsonData.removeWhere((key, value) => value == "" || value == null);

    return jsonData;
  }
}
