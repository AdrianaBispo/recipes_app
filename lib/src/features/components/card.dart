import 'package:flutter/material.dart';
//utils
import '../../shared/utils/color.dart';

class CardCusto extends StatelessWidget {
  CardCusto({required this.child, this.color = AppColor.secundaria});
  Widget child;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: child,
    );
  }
}
