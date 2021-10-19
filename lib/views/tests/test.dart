/*
 * @Author: 刘林
 * @Date: 2021-10-09 14:33:27
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 16:08:45
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text("Clicks: ${c.count}")),
          ElevatedButton(
              onPressed: () => Get.to(const Other(), arguments: "参数"),
              child: const Text('跳转')),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: c.increment),
    );
  }
}

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    final snackBar = SnackBar(
      content: const Text('Hi!'),
      action: SnackBarAction(
          label: 'I am a old and ugly snackbar :(', onPressed: () {}),
    );
    // Scaffold.of(context).showSnackBar(snackBar);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('${c.count},${Get.arguments}'),
          onPressed: () {
            // Get.back();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
