import '../../shared/models/meal.dart';
import '../../repository/meal_api.dart';
import 'package:flutter/foundation.dart';

class HomeController{
  final MealRepository repository;
  HomeController({required this.repository});

    final List<String> _filtros = [
    'Low Fat',
    'Low Saturated Fat',
    'Low Carb',
    'Low Calorie',
    'Sugar Free',
    'Low Sugar',
    'High Protein',
    'High Iron',
    'High Vitamin C',
    'High Calcium',
    'Source of Omega-3s',
    'Low Sodium',
    'High Vitamin D',
  ];

  List<String> get filtros => _filtros;

  Future<List<Meal>> filtragem(
      {required Future<List<Meal>> meal, required Future<List<Meal>> mealData, required String filtro}) async {
      
    List<Meal> resultado = [];
    meal = mealData;
    var food = await meal;

    if(food.isNotEmpty){
    var food = await meal;
    for (var i = 0; i < food.length; i++) {
      for (var o in food[i].tag.nutrition) {
        if (o.displayName.contains(filtro)) {
          resultado.add(food[i]);
        } // if
      } //for 2
    } //for 1
   
    }

    if (filtro == '') {
      return meal;
    }
     return resultado;
  }
  
   Future<List<Meal>> getRecipe() async {
    try{  
    final mealData = await repository.getRecipes();
    return mealData;
    }catch(e){
      debugPrint(e.toString());
      rethrow;
    }
  }
}