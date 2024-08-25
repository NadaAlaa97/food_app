import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';
import 'package:food_app/view/home/bloc/food_bloc.dart';
import 'package:simple_chips_input/select_chips_input.dart';
import '../../model/foodModel.dart';

class ChipsChoice extends StatefulWidget {
   ChipsChoice({super.key, required this.visibileImage});
  final bool visibileImage ;

  @override
  State<ChipsChoice> createState() => _ChipsChoiceState();
}

class _ChipsChoiceState extends State<ChipsChoice> {
  final List<Food> foodProducts = [];
  String? outputSelectChipsInput;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if(state is FoodInitial){
          return const Center(child: CircularProgressIndicator());
        } else if(state is FoodLoaded) {
          return
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SelectChipsInput(
                  marginBetweenChips: const EdgeInsets.all(3),
                    chipsText: state.foodProducts.map((food) => food.name).toList(),
                  prefixIcons: List.generate(state.foodProducts.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: widget.visibileImage ?
                            Image.network(state.foodProducts[index].iconImage,
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                            ) : null,
                          )
                  ),
                  onlyOneChipSelectable: true,
                  selectedChipTextStyle:  TextStyle(
                    color: Colors.white,
                    fontSize: 14.spMin,
                  ),
                  unselectedChipTextStyle:  TextStyle(
                    color: Colors.grey,
                    fontSize: 14.spMin,
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

                ),
              ],
            ),
          );
        } else{
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
