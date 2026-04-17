// Kelompok : Stardenbürdenhärdenbart
// Nama : Hamzah Hafidz Dzaky
// NIM : 103112400239

class SupportCenter {
  String idSupport;
  String pertanyaan;
  String jawaban;
  String goodScore;
  String badScore;
  String idAkun;

  SupportCenter({
    required this.idSupport,
    required this.pertanyaan,
    required this.jawaban,
    required this.goodScore,
    required this.badScore,
    required this.idAkun,
  });

  bool setGoodScore(String nilai) {
    if (isValidScore(nilai)) {
      goodScore = nilai;
      return true;
    } else {
      print("Good score harus berupa angka!");
      return false;
    }
  }

  bool setBadScore(String nilai) {
    if (isValidScore(nilai)) {
      badScore = nilai;
      return true;
    } else {
      print("Bad score harus berupa angka!");
      return false;
    }
  }
 
  void menampilkanArtikel() {
    print("=== ARTIKEL SUPPORT ===");
    print("Pertanyaan : $pertanyaan");
    print("Jawaban    : $jawaban");
    print("Good Score : $goodScore");
    print("Bad Score  : $badScore");
  }

  bool isValidScore(String value) {
    return int.tryParse(value) != null;
  }
}