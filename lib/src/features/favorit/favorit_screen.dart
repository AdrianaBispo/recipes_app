import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//ui
import '../../components/meal_item_ui.dart';
//models
import '../../shared/models/meal.dart';
//controller
import '../detail_controller.dart';

class FavoritScreen extends StatefulWidget {

  const FavoritScreen({Key? key}) : super(key: key);

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  late List<Meal> favoritos;
  late final DetailController controller;
  @override
  void initState(){
    super.initState();
    controller = context.read<DetailController>();
    favoritos = controller.meals;
  }

  @override
  Widget build(BuildContext context) {
    if (favoritos.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição adcionada'),
      );
    } else {
      return  SafeArea(
          child: ListView.builder(
            itemCount: favoritos.length,
            itemBuilder: (ctx, index) {
              return MealItem(favoritos[index]);
            },
          ),
      );
    }
  }
}
