import 'package:url_launcher/url_launcher.dart';

class WhatsappController {
  static Future<void> bukaWhatsapp(String nomorTelepon) async {
    final Uri url = Uri.parse("https://wa.me/$nomorTelepon");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }
}
