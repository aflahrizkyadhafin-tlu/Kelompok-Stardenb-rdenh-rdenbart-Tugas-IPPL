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
    return Kurir(
      idKurir: json['id_kurir'] as String,
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      kendaraan: json['kendaraan'] as String?,
      platNomor: json['plat_nomor'] as String?,
      statusKurir: StatusKurir.values.firstWhere(
        (e) => e.name == json['status_kurir'],
        orElse: () => StatusKurir.offline,
      ),
      lokasiLong: json['lokasi_long'] != null ? (json['lokasi_long'] as num).toDouble() : null,
      lokasiLat: json['lokasi_lat'] != null ? (json['lokasi_lat'] as num).toDouble() : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      idAkun: json['id_akun'] as String,
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

    jsonData.removeWhere((key, value) => value == null || value =="");
    
    return jsonData;
  }
}