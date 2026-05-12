class Pelanggan {
  final String idPelanggan;
  final String idAkun;

  Pelanggan({required this.idPelanggan, required this.idAkun});

  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return Pelanggan(
      idPelanggan: json["id_pelanggan"] ?? '',
      idAkun: json["id_akun"] ?? '',
    );
  }

  Map<String, dynamic> toJson(String idPelanggan, idAkun) {
    return {"id_pelanggan": idPelanggan, "id_akun": idAkun};
  }
}
