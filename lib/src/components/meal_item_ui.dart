import 'package:flutter/material.dart';
import '../shared/models/meal.dart';
//ui
import '../components/cardtitle.dart';
import '../components/card.dart';
//utils
import '../../utils/app_routes.dart';
import '../../utils/color.dart';

class MealItem extends StatelessWidget {
  final Meal meal; //objeto criado apartir da classe Meal

  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      //Push adciona essa tela ao topo da pilha da navegação+
      AppRoutes.MEAL_DETAIL,
      arguments: meal, //passando o objeto para a classe que está sendo chamada
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectMeal(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 260,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(meal.thumbnailUrl,
                  width: MediaQuery.of(context).size.width - 44,
                  height: 260,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaria,
                    ),
                  );
                }
              }),
            ),
            Align(
              child: CardCusto(
                child: CardTitle(
                  title: meal.title,
                  duracao: meal.duration,
                  rating: meal.rating,
                ),
              ),
              //alignment: Alignment.bottomLeft,
              alignment: const Alignment(0.2,
                  0.6), // (0.2 * width of FlutterLogo, 0.6 * height of FlutterLogo)
            ),
          ],
        ),
      ),
    );
  }
}
