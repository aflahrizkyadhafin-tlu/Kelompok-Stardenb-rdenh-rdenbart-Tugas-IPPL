import 'package:setting_api/models/pengiriman.dart';

class LogPengiriman {
  final String? idLog;
  final StatusPengiriman? statusPengiriman;
  final DateTime? createdAt;
  final String? idPengiriman;

  LogPengiriman({
    required this.idLog,
    required this.statusPengiriman,
    required this.createdAt,
    required this.idPengiriman,
  });

  factory LogPengiriman.fromJson(Map<String, dynamic> json) {
    return LogPengiriman(
      idLog: json['id_log'] as String,
      statusPengiriman: StatusPengiriman.values.firstWhere(
        (e) => e.name == json['status_pengiriman'],
        orElse: () => StatusPengiriman.pending,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      idPengiriman: json['id_pengiriman'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> jsonData = {
      'id_log': idLog,
      'status_pengiriman': statusPengiriman?.name,
      'created_at': createdAt?.toIso8601String(),
      'id_pengiriman': idPengiriman,
    };

    jsonData.removeWhere((key, value)=> value == null || value == "");

    return jsonData;
  }
}