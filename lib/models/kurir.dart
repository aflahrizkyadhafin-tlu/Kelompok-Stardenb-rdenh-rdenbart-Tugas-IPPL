enum StatusKurir { offline, available, on_delivery }

class Kurir {
  final String idKurir;
  final double rating;
  final String kendaraan;
  final String platNomor;
  final StatusKurir statusKurir;
  final double lokasiLong;
  final double lokasiLat;
  final String idAkun;

  Kurir({
    required this.idKurir,
    required this.rating,
    required this.kendaraan,
    required this.platNomor,
    required this.statusKurir,
    required this.lokasiLong,
    required this.lokasiLat,
    required this.idAkun,
  });

  factory Kurir.fromJson(Map<String, dynamic> json) {
    return Kurir(
      idKurir: json['id_kurir'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      kendaraan: json['kendaraan'] ?? '',
      platNomor: json['plat_nomor'] ?? '',
      statusKurir: StatusKurir.values.firstWhere(
        (e) => e.name == json['status_kurir'],
        orElse: () => StatusKurir.offline,
      ),
      lokasiLong: (json['lokasi_long'] ?? 0.0).toDouble(),
      lokasiLat: (json['lokasi_lat'] ?? 0.0).toDouble(),
      idAkun: json['id_akun'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kurir': idKurir,
      'rating': rating,
      'kendaraan': kendaraan,
      'plat_nomor': platNomor,
      'status_kurir': statusKurir.name,
      'lokasi_long': lokasiLong,
      'lokasi_lat': lokasiLat,
      'id_akun': idAkun,
    };
  }
}
