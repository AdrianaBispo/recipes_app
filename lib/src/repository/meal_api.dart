import 'dart:convert';
import '../shared/models/meal.dart';
import 'package:http/http.dart' as http;

abstract class IMealRepository {
  Future<List<Meal>> getRecipes();
}

class MealRepository implements IMealRepository {
  final url = "yummly2.p.rapidapi.com";

  final querystring = {"limit": "18", "start": "0", "tag": "list.recipe.popular"};

  static const api = String.fromEnvironment('key');
  final headers = {
    'x-rapidapi-host': "yummly2.p.rapidapi.com",
    'x-rapidapi-key': api, 
    "useQueryString": "true",
  };
  @override
  Future<List<Meal>> getRecipes() async {
    try {
      final response = await http.get(
        Uri.https(url, '/feeds/list', querystring),
        headers: headers,
      );
      if (response.statusCode == 200) {
        Map data =
            jsonDecode(response.body); //Tranforma em uma lista de propriedades
        List _temp = [];

        for (var json in data['feed']) {
          //passa os valores da chave feed para a variavel json
          _temp.add(json[
              'content']); //cada elemento do map Json foi transformado em uma lista

        } //for

        return Meal.recipesFromSnapshot(
            _temp); //agora serão enviados e transformados em objetos Meal

      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
