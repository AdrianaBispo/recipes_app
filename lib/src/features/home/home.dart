import 'package:flutter/material.dart';
//ui
import '../../components/meal_item_ui.dart';
import 'components/custochip.dart';
import '../../components/custoprogress.dart';
//models
import '../../shared/models/meal.dart';
//controller
import 'home_controller.dart';
//repository
import '../../repository/meal_api.dart';

class MealsScreen extends StatefulWidget {
  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  dynamic filtrado;
  String filtro = '';
  late Future<List<Meal>> mealData;
  late List<Meal> meals;
  HomeController mealController = HomeController(repository: MealRepository());

  @override
  void initState() {
    super.initState();
    filtro = '';
    mealData = mealController.getRecipe();
  }


  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Meal>>(
          future: mealController.filtragem(
            meal: mealData,
            mealData: mealData,
            filtro: filtro,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData && !snapshot.hasError) {
              return const Center(
                child: CustoCirculaProgress(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Column(children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mealController.filtros.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                        child: CustoChoiceChip(
                            text: mealController.filtros[index],
                            selected: filtro == mealController.filtros[index] ? true : false,
                            onSelected: (bool selected) {
                              setState(() {
                                filtro == mealController.filtros[index] ? filtro = '' : filtro = mealController.filtros[index];
                               
                                selected = !selected;
                               
                              });
                            }),
                      );
                    },
                  ),
                ),
                const Center(
                  child: Text('Não há receitas para mostrar!'),
                ),
              ]);
            }
            return Column(
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mealController.filtros.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                        child: CustoChoiceChip(
                            text: mealController.filtros[index],
                            selected: filtro == mealController.filtros[index] ? true : false,
                            onSelected: (bool selected) {
                              setState(() {
                                filtro == mealController.filtros[index] ? filtro = '' : filtro = mealController.filtros[index];
                              
                                selected = !selected;
                              
                              });
                            }),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (ctx, index) {
                      return MealItem(snapshot.data![index]);
                    },
                  ),
                ),
              ],
            );
          }
    );
  }
}
