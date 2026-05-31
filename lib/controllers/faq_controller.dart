import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/models/faq.dart';

class FaqController extends GetxController{
  Future<void> getAllFaq() async{
    try {
      final response = await db.from("faq").select();
      print("[getAllFaq] : $response");
    } catch (e) {
      print("[getAllFaq] #Error : $e");
    }
  }

  Future<void> tambahFaq(Faq faq) async{
    Map jsonData = faq.toJson();

    try {
      await db.from("faq").insert(jsonData);
      print("[tambahFaq] : Data berhasil ditambahkan");
    } catch (e) {
      print("[tambahFaq] #Error : $e");
    }
  }

  Future<void> updateFaq(String idSupport, String pertanyaan, String jawaban) async{
    Map jsonData = Faq(pertanyaan: pertanyaan, jawaban: jawaban).toJson();

    try {
      await db.from("faq").update(jsonData).eq("id_support", idSupport);
      print("[updateFaq] : Data dengan id $idSupport berhasil diubah");
    } catch (e) {
      print("[updateFaq] #Error : $e");
    }
  }

  Future<void> deleteFaq(String idSupport) async{
    try {
      await db.from("faq").delete().eq("id_support", idSupport);
      print("[updateFaq] : Data dengan id $idSupport berhasil dihapus");
    } catch (e) {
      print("[updateFaq] #Error : $e");
    }

  }

  Future<void> voteLikes(String idSupport) async {
    try {
      final checkSupport = await db
          .from("faq")
          .select("likes")
          .eq("id_support", idSupport)
          .maybeSingle(); 

      if (checkSupport != null) {
        int currentLikes = checkSupport["likes"] as int? ?? 0;
        await db.from("faq").update({
          "likes": currentLikes + 1
        }).eq("id_support", idSupport);
        print("[updateFaq] : Likes data dengan id $idSupport ditambah menjadi ${currentLikes + 1}");
      } else {
        print("[updateFaq] #Else : Data dengan id $idSupport tidak ditemukan");
      }
    } catch (e) {
      print("[updateFaq] #Error : $e");
    }
}

  Future<void> voteDislikes(String idSupport) async{
      try {
      final checkSupport = await db
          .from("faq")
          .select("dislikes")
          .eq("id_support", idSupport)
          .maybeSingle();

      if (checkSupport != null) {
        int currentDislikes = checkSupport["dislikes"] as int? ?? 0;
        await db.from("faq").update({
          "dislikes": currentDislikes + 1
        }).eq("id_support", idSupport);
        print("[updateFaq] : Dislikes data dengan id $idSupport ditambah menjadi ${currentDislikes + 1}");
      } else {
        print("[updateFaq] #Else : Data dengan id $idSupport tidak ditemukan");
      }
    } catch (e) {
      print("[updateFaq] #Error : $e");
    }
  }
}