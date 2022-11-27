class IngredientLine {
    IngredientLine({
        required this.wholeLine,
    });

    String wholeLine;

    factory IngredientLine.fromJson(Map<String, dynamic> json) => IngredientLine(
        wholeLine: json["wholeLine"],
    );

    Map<String, dynamic> toJson() => {
        "wholeLine": wholeLine,
    };
}