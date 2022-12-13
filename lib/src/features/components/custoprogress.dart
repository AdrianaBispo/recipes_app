import 'package:flutter/material.dart';
//utils
import '../../shared/utils/color.dart';

class CustoCirculaProgress extends StatelessWidget {
  const CustoCirculaProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primaria,
      ),
    );
  }
}
