import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList categories = [].obs;
  static CategoryController instance = Get.find();
  firebaseCategories() => FirebaseFirestore.instance
      .collection('cat')
      .doc('cat')
      .get()
      .then((value) {
    value.get('cat').forEach((v){
      categories.add(v);
      print('value${categories}');
    });

    // value.get('cat').forEach((v) => categories.add(v));
  });

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    firebaseCategories();
  }
}
