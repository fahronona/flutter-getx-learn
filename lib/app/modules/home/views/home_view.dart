import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/home/views/list_widget_view.dart';

import '../controllers/home_controller.dart';
import '../controllers/widget_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final ctrlg= Get.create<WidgetController>((() => WidgetController()));
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.count++;
            },
            child: Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              controller.count--;
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        // title: Text("App"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  Get.changeTheme(context.isDarkMode
                      ? ThemeData.light()
                      : ThemeData.dark());
                },
                icon: context.isDarkMode
                    ? Icon(Icons.light_mode_sharp)
                    : Icon(Icons.mode_night_sharp)),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 2), () {});
        },
        child: Center(
            child: Obx(() => ListView.builder(
                itemCount: controller.count.toInt() <= 0
                    ? 1
                    : controller.count.toInt(),
                itemBuilder: ((context, index) {
                  return ListWidgetView(
                    
                  );
                })))),
      ),
    );
  }
}
