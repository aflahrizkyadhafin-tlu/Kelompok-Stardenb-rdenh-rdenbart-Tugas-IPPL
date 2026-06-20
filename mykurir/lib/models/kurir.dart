// Enum untuk Status Kurir
enum StatusKurir { offline, available, handling_order }

class Kurir {
  final String? idKurir;
  final double? rating;
  final String? kendaraan;
  final String? platNomor;
  final StatusKurir? statusKurir;
  final double? lokasiLong;
  final double? lokasiLat;
  final DateTime? createdAt;
  final String? idAkun;

  Kurir({
    this.idKurir,
    this.rating,
    this.kendaraan,
    this.platNomor,
    this.statusKurir,
    this.lokasiLong,
    this.lokasiLat,
    this.createdAt,
    this.idAkun,
  });

  factory Kurir.fromJson(Map<String, dynamic> json) {
    StatusKurir? statusEnum;
    if (json['status_kurir'] != null) {
      statusEnum = StatusKurir.values.firstWhere(
        (e) => e.name == json['status_kurir'],
        orElse: () => StatusKurir.offline,
      );
    }

    return Kurir(
      idKurir: json['id_kurir'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      kendaraan: json['kendaraan'] as String?,
      platNomor: json['plat_nomor'] as String?,
      statusKurir: statusEnum,
      lokasiLong: (json['lokasi_long'] as num?)?.toDouble(),
      lokasiLat: (json['lokasi_lat'] as num?)?.toDouble(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      idAkun: json['id_akun'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_kurir': idKurir,
      'rating': rating,
      'kendaraan': kendaraan,
      'plat_nomor': platNomor,
      'status_kurir': statusKurir?.name,
      'lokasi_long': lokasiLong,
      'lokasi_lat': lokasiLat,
      'created_at': createdAt?.toIso8601String(),
      'id_akun': idAkun,
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
