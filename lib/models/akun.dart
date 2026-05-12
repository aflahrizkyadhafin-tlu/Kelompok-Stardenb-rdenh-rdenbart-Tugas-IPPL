class Akun {
  final String idAkun;
  final String username;
  final String namaLengkap;
  final String email;
  final String alamat;
  final String noTelepon;
  final String fotoProfile;

  Akun({
    required this.idAkun,
    required this.username,
    required this.namaLengkap,
    required this.email,
    required this.alamat,
    required this.noTelepon,
    required this.fotoProfile,
  });

  factory Akun.fromJson(Map<String, dynamic> json) {
    return Akun(
      idAkun: json["id_akun"] ?? '',
      username: json["username"] ?? '',
      namaLengkap: json["nama_lengkap"] ?? '',
      email: json["email"] ?? '',
      alamat: json["alamat"] ?? '',
      noTelepon: json["no_telepon"] ?? '',
      fotoProfile: json["foto_profile"] ?? '',
    );
  }

  Map<String, dynamic> toJson(
    String idAkun,
    username,
    namaLengkap,
    alamat,
    nomorTelepon,
    fotoProfile,
  ) {
    return {
      "id_akun": idAkun,
      "username": username,
      "nama_lengkap": namaLengkap,
      "alamat": alamat,
      "no_telepon": nomorTelepon,
      "foto_profile": fotoProfile,
    };
  }
}
