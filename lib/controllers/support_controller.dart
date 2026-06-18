import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/loading_controller.dart';
import 'package:setting_api/models/faq.dart';

class SupportController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());
  RxList<Faq> faqList = <Faq>[].obs;

  Future<void> getAllFAQ() async {
    try {
      final response = await db.from("faq").select();
      response.forEach((e) => faqList.add(Faq.fromJson(e)));
    } catch (e) {
      print("[getAllFAQ] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> tambahFAQ(Faq sendData) async {
    try {
      await db.from("faq").insert(sendData.toJson());
      print("[tambahFAQ] : Data berhasil ditambahkan");
    } catch (e) {
      print("[tambahFAQ] #Error : $e");
    }
  }

  Future<void> updateFAQ(Faq updateData) async {
    Map<String, dynamic> jsonData = updateData.toJson();
    jsonData.removeWhere((key, value) => key == "id_support");

    try {
      await db.from("faq").update(jsonData).eq("id_faq", updateData.idSupport!);
      print(
        "[updateFAQ] : Update data dengan id ${updateData.idSupport} telah berhasil",
      );
    } catch (e) {
      print("[updateFAQ] #Error : $e");
    }
  }

  Future<void> deleteFAQ(String idSupport) async {
    try {
      await db.from("faq").delete().eq("id_support", idSupport);
      print("[updateFAQ] : Update data dengan id $idSupport telah berhasil");
    } catch (e) {
      print("[updateFAQ] #Error : $e");
    }
  }

  Future<void> voteLikes(String idSupport) async {
    try {
      final getLikes = await db
          .from("faq")
          .select("likes")
          .eq("id_support", idSupport)
          .maybeSingle();

      if (getLikes!.isNotEmpty) {
        await db
            .from("faq")
            .update({"likes": getLikes["likes"] + 1})
            .eq("id_support", idSupport);
      }

      print("[voteLikes] : Likes data dengan id $idSupport bertambah 1");
    } catch (e) {
      print("[voteLikes] #Error : $e");
    }
  }

  Future<void> voteDislikes(String idSupport) async {
    try {
      final getDislikes = await db
          .from("faq")
          .select("dislikes")
          .eq("id_support", idSupport)
          .maybeSingle();

      if (getDislikes!.isNotEmpty) {
        await db
            .from("faq")
            .update({"dislikes": getDislikes["dislikes"] + 1})
            .eq("id_support", idSupport);
      }

      print("[voteDislikes] : Dislikes data dengan id $idSupport bertambah 1");
    } catch (e) {
      print("[voteDislikes] #Error : $e");
    }
  }
}
