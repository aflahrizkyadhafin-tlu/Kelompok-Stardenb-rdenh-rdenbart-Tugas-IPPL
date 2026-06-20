import 'package:mykurir/models/pengiriman.dart';

class LogPengiriman {
  final String? idLog;
  final StatusPengiriman? statusPengiriman;
  final DateTime? createdAt;
  final String? idPengiriman;

  LogPengiriman({
    this.idLog,
    this.statusPengiriman,
    this.createdAt,
    this.idPengiriman,
  });

  factory LogPengiriman.fromJson(Map<String, dynamic> json) {
    StatusPengiriman? statusEnum;
    if (json['status_pengiriman'] != null) {
      statusEnum = StatusPengiriman.values.firstWhere(
        (e) => e.name == json['status_pengiriman'],
        orElse: () => StatusPengiriman.pending,
      );
    }

    return LogPengiriman(
      idLog: json['id_log'] as String?,
      statusPengiriman: statusEnum,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      idPengiriman: json['id_pengiriman'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_log': idLog,
      'status_pengiriman': statusPengiriman?.name,
      'created_at': createdAt?.toIso8601String(),
      'id_pengiriman': idPengiriman,
    };

    // Menghapus key jika value null atau string kosong
    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
