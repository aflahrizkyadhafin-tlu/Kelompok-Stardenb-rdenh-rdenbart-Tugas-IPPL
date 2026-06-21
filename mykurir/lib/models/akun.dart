enum UserRole { pengguna, kurir, admin }

class Akun {
  String? idAkun;
  String? username;
  String? namaLengkap;
  String? alamat;
  UserRole? role;
  DateTime? createdAt;
  String? fotoProfile;
  String? idUser;

  Akun({
    this.idAkun,
    this.username,
    this.namaLengkap,
    this.alamat,
    this.role,
    this.createdAt,
    this.fotoProfile,
    this.idUser,
  });

  factory Akun.fromJson(Map<String, dynamic> json) {
    UserRole? roleEnum;
    if (json['role'] != null) {
      roleEnum = UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.pengguna,
      );
    }

    return Akun(
      idAkun: json['id_akun'] as String?,
      username: json['username'] as String?,
      namaLengkap: json['nama_lengkap'] as String?,
      alamat: json['alamat'] as String?,
      role: roleEnum,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      fotoProfile: json['foto_profile'] as String?,
      idUser: json['id_user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_akun': idAkun,
      'username': username,
      'nama_lengkap': namaLengkap,
      'alamat': alamat,
      'role': role?.name,
      'created_at': createdAt?.toIso8601String(),
      'foto_profile': fotoProfile,
      'id_user': idUser,
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
