
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mobileuts/model/food_model.dart';
// import '../models/food_model.dart';

class FoodService {
  static Future<List<Food>> loadFoods() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/foods.json',
    );
    final List data = json.decode(jsonString);
    return data.map((e) => Food.fromJson(e)).toList();
  }
}
