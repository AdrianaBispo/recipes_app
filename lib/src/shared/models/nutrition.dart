class Nutrition {
  late String displayName;

  Nutrition({
    required this.displayName,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        displayName: json["display-name"],
      );

  Map<String, dynamic> toJson() => {
        "display-name": displayName,
      };
}
