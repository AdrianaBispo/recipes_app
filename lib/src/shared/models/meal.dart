import 'ingredient_lines.dart';
import 'tags.dart';

class Meal {
  Tag tag;
  final String title;
  final String thumbnailUrl;
  List<IngredientLine> ingredientLines;
  List<String> steps;
  final String duration;
  final double rating;

  Meal({
    required this.tag,
    required this.title,
    required this.thumbnailUrl,
    required this.ingredientLines,
    required this.steps,
    required this.rating,
    required this.duration,
  });

  factory Meal.fromJson(dynamic json) {
    return Meal(
      tag: Tag.fromJson(json['tags']),
      ingredientLines: json["ingredientLines"] == null
          ? []
          : List<IngredientLine>.from(
              json["ingredientLines"].map((x) => IngredientLine.fromJson(x))),
      title: json['details']['name'] as String,
      thumbnailUrl: json['details']['images'][0]['hostedLargeUrl'] as String,
      rating: json['details']['rating'] as double,
      duration: json['details']['totalTime'] as String,
      steps: json['preparationSteps'] == null
          ? [''] //type 'Null' is not a subtype of type 'List<String>' of 'function result'

          : List<String>.from(json["preparationSteps"].map((x) => x)),
    );
  }

  static List<Meal> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      //mapeia cada elemento da lista
      return Meal.fromJson(
          data); //cria uma instancia da classe Meal apartir de um Json
    }).toList(); //transforma em lista pois o Map retorna um interavel e esperamos uma lista de Meal
  }

  @override
  String toString() {
    return 'Meal {name: $title, image: $thumbnailUrl, rating: $rating, totalTime: $duration, tag: $tag}';
  }
}
