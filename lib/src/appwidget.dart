import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//view
import '../src/features/bottom_bar/bottom_bar_screen.dart';
import '../src/features/detail/detail_screen.dart';
//Controller
import 'features/detail_controller.dart';
//utils
import 'shared/utils/app_routes.dart';
import 'shared/utils/color.dart';

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DetailController(),),
      ],
      child: MaterialApp(
        title: 'Vamos Cozinhar?',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'RobotoCondensed-Regular',
          canvasColor: Colors.white,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed-Light',
                  color: AppColor.black,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
    
                headline5: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed-Light',
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaria,
                ),
    
                
          ),
        ),
              
        routes: {
          AppRoutes.HOME: (ctx) => BottomBarScreen(),
          AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        },
      ),
    );
  }
}
