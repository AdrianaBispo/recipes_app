import 'package:flutter/material.dart';
//utils
import '../../shared/utils/color.dart';

class Ranting extends StatelessWidget {
  Ranting({required this.rating, this.cor = AppColor.primaria});
  final double rating;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: cor == AppColor.primaria ? AppColor.secundaria : AppColor.primaria,
            size: 18,
          ),
          const SizedBox(width: 7),
          Text(
            rating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: cor == AppColor.primaria ? AppColor.secundaria : AppColor.primaria,
            ),
          ),
        ],
      ),
    );
  }
}
