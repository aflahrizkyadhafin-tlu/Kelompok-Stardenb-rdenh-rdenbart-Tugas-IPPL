enum StatusPengiriman { pickup, on_delivery, delivered, cancelled }

class LogPengiriman {
  final String idLog;
  final StatusPengiriman statusPengiriman;
  final DateTime waktuUpdate;
  final String idPengiriman;

  LogPengiriman({
    required this.idLog,
    required this.statusPengiriman,
    required this.waktuUpdate,
    required this.idPengiriman,
  });

  factory LogPengiriman.fromJson(Map<String, dynamic> json) {
    return LogPengiriman(
      idLog: json['id_log'] ?? '',
      statusPengiriman: StatusPengiriman.values.firstWhere(
        (e) => e.name == json['status_pengiriman'],
        orElse: () => StatusPengiriman.pickup,
      ),
      waktuUpdate: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      idPengiriman: json['id_pengiriman'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_log': idLog,
      'status_pengiriman': statusPengiriman.name,
      'created_at': waktuUpdate.toIso8601String(),
      'id_pengiriman': idPengiriman,
    };
  }
}
