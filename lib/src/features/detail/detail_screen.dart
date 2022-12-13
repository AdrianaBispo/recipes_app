import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//models
import '../../shared/models/meal.dart';
//controller
import '../detail_controller.dart';
//utils
import '../../shared/utils/color.dart';
//ui
import '../components/cardtitle.dart';
import '../components/card.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({
    Key? key,
});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late final DetailController controller;
  @override 
  void initState(){
    super.initState();
    controller = context.read<DetailController>();
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(left: 40.0, top: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _imagem(String imagem) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Image.network(imagem, fit: BoxFit.cover,
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
    );
  }

  Widget custoAppBar(Meal meal, context) {
    return Container(
      color: AppColor.primaria,
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              color: AppColor.black,
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Consumer<DetailController>(
            builder: (context, controller, child) {
              return CircleAvatar(
                radius: 20,
                backgroundColor: AppColor.secundaria,
                child: IconButton(
                  color: AppColor.primaria,
                  icon: Icon(
                    controller.meals.contains(meal)
                    ? Icons.favorite_sharp
                    : Icons.favorite_border_outlined,),
                  onPressed: () {
                   controller.adcionarReceita(meal: meal);
                  },
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    final controller = context.watch<DetailController>();
    return Scaffold(
      backgroundColor: AppColor.secundaria,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              custoAppBar(meal, context),
              SizedBox(
                height: 320,
                child: Stack(
                  children: [
                    _imagem(meal.thumbnailUrl),
                    Align(
                      alignment: const Alignment(0.2, 0.8),
                      child: CardCusto(
                        color: AppColor.primaria,
                        child: CardTitle(
                          title: meal.title,
                          duracao: meal.duration,
                          rating: meal.rating,
                          cor: AppColor.secundaria,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: _sectionTitle(context, 'Ingredient: '),
              ),
              ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: meal.ingredientLines.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 40,
                      ),
                      child: Text(
                        meal.ingredientLines[index].wholeLine,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'RobotoCondensed-Light',
                          color: AppColor.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.centerLeft,
                child: _sectionTitle(context, 'Steps: '),
              ),
              ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: meal.steps.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColor.primaria,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: AppColor.secundaria,
                                fontFamily: 'RobotoCondensed-Light',
                              ),
                            ),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                      ),
                      const Divider(
                        indent:
                            50, // empty space to the leading edge of divider.
                        endIndent: 50,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
