import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notes_app/app/routes/app_pages.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saved Notes :",
              style: Get.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Skeletonizer(
                enabled: false,
                child: Obx( () =>
                ListView.separated(
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      var note = controller.notes[index];
                      return Dismissible(
                        key: UniqueKey(),
                        child: Card(
                          child: ListTile(
                            leading: const Icon(Icons.note_rounded),
                            title: Text(note['note'] ?? ' '),
                            trailing: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: (note['priority'] == 'HIGH')
                                    ? Colors.red
                                    : (note['priority'] == 'MEDIUM')
                                        ? Colors.yellow
                                        : Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
