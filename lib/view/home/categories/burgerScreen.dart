import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/view/custom_widgets/chip_list.dart';
import 'package:food_app/view/custom_widgets/verticalProductsList.dart';

import '../../../utils/myTheme.dart';
import '../../custom_widgets/searchTextField.dart';

class BurgerScreen extends StatelessWidget {
  const BurgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 3),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.1),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 25.spMin,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'برجر',
          style: TextStyle(
            fontSize: 20.spMin,
            fontWeight: FontWeight.w500,
            fontFamily: 'IBM Plex Sans Arabic',
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(child: SearchTextField(
                    onChanged: (value){
                    },
                  )),
                  SizedBox(width: 2.w,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: MyTheme.mainPurpleColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.tune,color: Colors.white,size: 25.spMin,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h,),
             ChipsChoice(visibileImage: false,),
            SizedBox(height: 10.h,),
            Expanded(child: VerticalProductsList(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
