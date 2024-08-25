import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';
import 'package:food_app/view/custom_widgets/Carousel_slider.dart';
import 'package:food_app/view/custom_widgets/chip_list.dart';
import 'package:food_app/view/home/filter-slider.dart';
import 'package:food_app/view/custom_widgets/horizontal_list.dart';
import 'package:food_app/view/custom_widgets/row-section.dart';
import 'package:food_app/view/custom_widgets/searchTextField.dart';
import 'package:food_app/view/home/categories/categories.dart';
import 'package:food_app/view/home/suggestedForYouScreen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          children: [
             Expanded(child: SearchTextField(
              onChanged: (value){
              },
            )),
            SizedBox(width: 2.w,),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                FilterSlider()
                ));
              },
              child: Container(
                height: 35,
                width: 35,
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
      body: ListView(
        children:   [
          SizedBox(height: 10.h,),
          const CarouselSliderWidget(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RowSection(text: 'الفئات', textTwo: 'عرض المزيد', onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Categories()));
            }),
          ),
            ChipsChoice(visibileImage: true,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RowSection(text: 'عروض كبيره', textTwo: 'عرض المزيد', onTap: (){},icon:Icons.local_fire_department_rounded ,),
          ),
          const HorizontalProductsList(color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RowSection(text: 'مقترحه لك', textTwo: 'عرض المزيد', onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
              const SuggestedScreen()
              ));
            },),
          ),
          const HorizontalProductsList(color: Colors.white),

        ],
      ),
    );
  }
}
