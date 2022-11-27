import 'nutrition.dart';

class Tag {
    Tag({
        required this.nutrition,
    });

    List<Nutrition> nutrition;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        nutrition: json["nutrition"] == null ? [] : List<Nutrition>.from(json["nutrition"].map((x) => Nutrition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nutrition": List<dynamic>.from(nutrition.map((x) => x.toJson())),
    };
}