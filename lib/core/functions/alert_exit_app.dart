import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
   Get.defaultDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 20),
    title: 'Quit',
    middleText: 'Are you sure you want to exit the app?',
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[500]),
        child: const Text('Cancel',style: TextStyle(color: Colors.white),),
      ),
      const SizedBox(width: 25),
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red[800]),
        child: const Text('Quit',style: TextStyle(color: Colors.white),),
      ),
    ],
  );
  return Future.value(true);
}
