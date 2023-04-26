class AppRoutes {
  static AppRoutes? _instance;
  AppRoutes._();
  static AppRoutes get instance {
    _instance ??= AppRoutes._();
    return _instance!;
  }
  
  String get HOME => '/';
  String get MEAL_SCREEN => '/meal-screen';
  String get CATEGORIES_MEALS => '/categories-meals';
  String get MEAL_DETAIL => '/meal-detail';
  String get FAVORIT => '/favorit';
}
