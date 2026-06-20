class Laporan {
  final String? idLaporan;
  final String? reporterId;
  final String? reportedId;
  final String? pesan;
  final DateTime? createdAt;

  Laporan({
    this.idLaporan,
    this.reporterId,
    this.reportedId,
    this.pesan,
    this.createdAt,
  });

  factory Laporan.fromJson(Map<String, dynamic> json) {
    return Laporan(
      idLaporan: json['id_laporan'] as String?,
      reporterId: json['reporter_id'] as String?,
      reportedId: json['reported_id'] as String?,
      pesan: json['pesan'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_laporan': idLaporan,
      'reporter_id': reporterId,
      'reported_id': reportedId,
      'pesan': pesan,
      'created_at': createdAt?.toIso8601String(),
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
