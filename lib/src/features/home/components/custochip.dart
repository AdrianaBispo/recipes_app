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
      backgroundColor: AppColor.instance.secundaria,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      label: Text(
        text,
        style: TextStyle(
          color: AppColor.instance.black,
        ),
      ),
      selectedColor: AppColor.instance.primaria,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: AppColor.instance.primaria,
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
