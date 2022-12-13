import 'package:flutter/material.dart';
//utils
import '../../../shared/utils/color.dart';

class CustoChoiceChip extends StatelessWidget {
  CustoChoiceChip(
      {required this.text, required this.selected, required this.onSelected, key});
  final String text;
  bool selected;
  void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: AppColor.secundaria,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      label: Text(
        text,
        style: const TextStyle(
          color: AppColor.black,
        ),
      ),
      selectedColor: AppColor.primaria,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: AppColor.primaria,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      pressElevation: 0,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
