import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';
import 'package:simple_chips_input/select_chips_input.dart';

class FilterChipsChoice extends StatefulWidget {
  const FilterChipsChoice({super.key});

  @override
  State<FilterChipsChoice> createState() => _FilterChipsChoiceState();
}

class _FilterChipsChoiceState extends State<FilterChipsChoice> {
  final List<String> foodProducts = [
    'الكل',
    'البرجر',
    'البيتزا',
    'الساندوتشات',
    'السمك المشوي',
    'السوشي',
    'الجمبري',
    'السلطات',
    'المشروبات'
  ];
  String? outputSelectChipsInput;

  @override
  Widget build(BuildContext context) {
          return SelectChipsInput(
            marginBetweenChips: const EdgeInsets.all(8),
            chipsText: foodProducts,
            onlyOneChipSelectable: true,
            selectedChipTextStyle:  TextStyle(
              color: Colors.white,
              fontSize: 15.spMin,
            ),
            unselectedChipTextStyle:  TextStyle(
              color: Colors.grey,
              fontSize: 15.spMin,
            ),
            onTap: (selectedChips, selectedIndex) {
              setState(() {
                outputSelectChipsInput = selectedChips;
              });
            },
            widgetContainerDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            unselectedChipDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey)
            ),
            selectedChipDecoration: BoxDecoration(
              color: MyTheme.mainPurpleColor,
              borderRadius: BorderRadius.circular(10.r),
            ),

          );
        }
  }

