import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/routes/app_pages.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  const AddNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNoteView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             Text("Notes",style: Get.textTheme.titleLarge,),
            TextFormField(
              controller: controller.noteTextController,
              maxLines: 4,
                keyboardType:   TextInputType.multiline,
                textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Write Notes",
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
             
            ),
            const SizedBox(
              height: 25,
            ),
        Obx( () =>
           DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: ['HIGH','MEDIUM','LOW']
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
                value : controller.selectedValue.value,
          
            onChanged: (String? value) {
              controller.selectedValue.value = value;
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: Get.width,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
                ),
        ),
            ElevatedButton(onPressed: () {
              GetStorage box = GetStorage();
              var list = box.read('notes') ?? [];
              var listPriority = box.read('priority') ?? [];
              box.erase();
              list.add(
                controller.noteTextController.text.isEmpty ? 'Sample':controller.noteTextController.text,
               
              );
              listPriority.add(
                 controller.selectedValue.value ?? 'HIGH',
              );
              box.write('notes', list);
              box.write('priority', listPriority);
              // box.erase();
              Get.offAllNamed(Routes.HOME);

            }, child: const Text("Add Notes"),
            ),
          ],
        ),
      ),
    );
  }
}
