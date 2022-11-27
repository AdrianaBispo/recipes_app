import 'package:flutter/material.dart';
//models
import '../shared/models/meal.dart';

class DetailController extends ChangeNotifier{
  List<Meal> meals = [];

  void adcionarReceita({required Meal meal}){
    if(meals.contains(meal) == false){
    meals.add(meal);
    notifyListeners();
    } else{
       meals.remove(meal);
      notifyListeners();
    }
  }
}