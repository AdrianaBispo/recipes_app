import 'package:flutter/material.dart';
import '../../utils/color.dart';

class Duration extends StatelessWidget {
  Duration({required this.time, this.cor = AppColor.primaria});
  final String time;
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
            Icons.schedule,
            color: cor == AppColor.primaria ? AppColor.secundaria : AppColor.primaria,
            size: 18,
          ),
          const SizedBox(width: 7),
          Text(
            time,
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