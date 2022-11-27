import 'package:flutter/material.dart';
//ui
import 'duration.dart';
import 'rating.dart';
//utils
import '../../../../utils/color.dart';

class CardTitle extends StatelessWidget {
  CardTitle(
      {required this.title,
      required this.duracao,
      required this.rating,
      this.cor = AppColor.primaria,
      });
  final String title;
  final String duracao;
  final double rating;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 84,
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
              ),
              margin: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed-Light',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ranting(rating: rating, cor: cor,),
            Duration(
              time: duracao, cor: cor,
            ),
          ],
        ),
      ],
    );
  }
}
