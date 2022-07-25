import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/home/controllers/widget_controller.dart';

class ListWidgetView extends StatelessWidget {
  const ListWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrlg = Get.find<WidgetController>();
    return Padding(
        padding: EdgeInsets.only(right: 18, left: 18, top: 5),
        child: Obx((() => GestureDetector(
              onTap: () {
                ctrlg.check.toggle();
              },
              child: Card(
                child: ListTile(
                  title: Text(ctrlg.check.value.toString()),
                  leading: ctrlg.check.isTrue
                      ? Icon(Icons.check_box_outlined)
                      : Icon(Icons.check_box_outline_blank),
                  subtitle: Text("Subtitle"),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ))));
  }
}
