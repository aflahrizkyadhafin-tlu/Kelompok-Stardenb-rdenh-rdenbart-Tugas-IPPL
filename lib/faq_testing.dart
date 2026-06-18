import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/faq_controller.dart';
import 'package:setting_api/models/faq.dart';

class FaqTesting extends StatelessWidget {
  const FaqTesting({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi FaqController
    final FaqController controller = Get.put(FaqController());

    // Controller untuk menampung input dari UI
    final TextEditingController idSupportController = TextEditingController();
    final TextEditingController pertanyaanController = TextEditingController();
    final TextEditingController jawabanController = TextEditingController();
    final TextEditingController idAdminController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ Controller Tester'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Input Fields',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: idSupportController,
              decoration: const InputDecoration(
                labelText: 'ID Support (untuk Update/Delete/Vote)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: pertanyaanController,
              decoration: const InputDecoration(
                labelText: 'Pertanyaan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: jawabanController,
              decoration: const InputDecoration(
                labelText: 'Jawaban',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: idAdminController,
              decoration: const InputDecoration(
                labelText: 'ID Admin (Opsional untuk Tambah)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // 1. Ambil Semua FAQ
            ElevatedButton.icon(
              onPressed: () => controller.getAllFaq(),
              icon: const Icon(Icons.refresh),
              label: const Text('Get All FAQ (Cek Debug Console)'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
            ),
            const SizedBox(height: 12),

            // 2. Tambah FAQ
            ElevatedButton.icon(
              onPressed: () {
                if (pertanyaanController.text.isEmpty ||
                    jawabanController.text.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Pertanyaan dan Jawaban tidak boleh kosong',
                  );
                  return;
                }
                Faq newFaq = Faq(
                  pertanyaan: pertanyaanController.text,
                  jawaban: jawabanController.text,
                  createdAt: DateTime.now(),
                );
                controller.tambahFaq(newFaq);
              },
              icon: const Icon(Icons.add),
              label: const Text('Tambah FAQ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(45),
              ),
            ),
            const SizedBox(height: 12),

            // 3. Update FAQ
            ElevatedButton.icon(
              onPressed: () {
                if (idSupportController.text.isEmpty) {
                  Get.snackbar('Error', 'ID Support harus diisi untuk update');
                  return;
                }
                controller.updateFaq(
                  idSupportController.text,
                  pertanyaanController.text,
                  jawabanController.text,
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Update FAQ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(45),
              ),
            ),
            const SizedBox(height: 12),

            // 4. Delete FAQ
            ElevatedButton.icon(
              onPressed: () {
                if (idSupportController.text.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'ID Support harus diisi untuk menghapus',
                  );
                  return;
                }
                controller.deleteFaq(idSupportController.text);
              },
              icon: const Icon(Icons.delete),
              label: const Text('Delete FAQ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(45),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Voting Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // 5. Vote Likes & Dislikes
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (idSupportController.text.isEmpty) {
                        Get.snackbar('Error', 'ID Support harus diisi');
                        return;
                      }
                      controller.voteLikes(idSupportController.text);
                    },
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Like'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (idSupportController.text.isEmpty) {
                        Get.snackbar('Error', 'ID Support harus diisi');
                        return;
                      }
                      controller.voteDislikes(idSupportController.text);
                    },
                    icon: const Icon(Icons.thumb_down),
                    label: const Text('Dislike'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
