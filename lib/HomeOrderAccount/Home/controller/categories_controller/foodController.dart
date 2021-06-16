import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz/HomeOrderAccount/Home/Models/food_modals/foods_modals.dart';
import 'package:hungerz/HomeOrderAccount/Home/constants/firebase_constants.dart';

// class Animal {
//   final String name;
//   final int id;
//
//   Animal({
//     this.name,
//     this.id,
//   });
// }
class FoodController extends GetxController {



  static FoodController instance = Get.find();
  RxList<FoodModel> foods = RxList<FoodModel>([]);
  List categories = [];
  TextEditingController foodNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  RxString image = ''.obs;
  RxString docID= ''.obs;
  RxString restaurantName = ''.obs;
  RxString restaurantAddress = ''.obs;
  // List<MultiSelectItem>  cat = [];
  RxList MultiCategories= [].obs;
  RxList catItems = [].obs;


  Stream<List<FoodModel>> getfoods(document) => firebaseFirestore
      .collection('foods')
     .where('restaurantName',isEqualTo: docID.value)
      .snapshots()
      .map((query) => query.docs
      .map((item) => FoodModel.fromMap(item.data(),item.id))
      .toList());


   // firebaseCategories() => firebaseFirestore
   //    .collection('c')
   //    .doc('cat').get().then((value) => value.get('cat').forEach((v)=>cat.add(MultiSelectItem(v,v),),),);
   //
   //

   //     forEach((element) {
   //      categories.add(element.get('cat'));
   //      print('element ${element.get('cat')}');
   //      // print(categories[0]);
   //      cat = categories
   //          .map((animal) => MultiSelectItem(animal, animal)).toList();
   // });

@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // firebaseCategories();

}





}
