import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz/HomeOrderAccount/Home/Models/restaurant_modals/restaurant_modals.dart';
import 'package:hungerz/HomeOrderAccount/Home/constants/firebase_constants.dart';

class RestaurantControllers extends GetxController{
  static RestaurantControllers instance = Get.find();
  RxList<RestaurantModel> restaurants = RxList<RestaurantModel>([]);



  Stream<List<RestaurantModel>> getrestaurants() => firebaseFirestore
      .collection('dezo')
      .doc('Tuticorin')
      .collection('restaurants')
      .snapshots()
      .map((query) => query.docs
      .map((item) => RestaurantModel.fromMap(item.data()))
      .toList());
  @override
  onReady() {
    super.onReady();
    // products.bindStream(getAllProducts());
    restaurants.bindStream(getrestaurants());

  }
}