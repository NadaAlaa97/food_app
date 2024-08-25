import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';
import 'package:food_app/view/custom_widgets/filterChipList.dart';

class FilterSlider extends StatefulWidget {
  @override
  State<FilterSlider> createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  RangeValues values = const RangeValues(78, 150);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
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
        title: Text('التصنيف', style: TextStyle( fontSize: 20.spMin,
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
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('نطاق السعر', style: TextStyle(color: Colors.black,
                fontFamily: 'IBM Plex Sans Arabic',fontWeight: FontWeight.w500,
                  fontSize: 19.spMin,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${values.end.toString()}', style: TextStyle(fontSize: 17.spMin,color: Colors.black,fontWeight: FontWeight.w500),),
                  Text('\$${values.start.toString()}', style: TextStyle(fontSize: 17.spMin,color: Colors.black,fontWeight: FontWeight.w500),),

                ],
              ),
            ),
            Center(
              child: RangeSlider(
                min: 78,
                  max: 150,
                  values: values,
                  divisions: 10,
                  labels: labels,
                  onChanged: (newValues){
                    setState(() {
                      values = newValues;
                    });
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('الفئات', style: TextStyle(color: Colors.black,
                  fontFamily: 'IBM Plex Sans Arabic',fontWeight: FontWeight.w500,
                  fontSize: 19.spMin,)),
              ),
            ),
            const FilterChipsChoice()


          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              height: 55,
              width: 150,
              child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(4),
                    shadowColor: const MaterialStatePropertyAll(Colors.black54),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      side: const BorderSide(color: MyTheme.mainPurpleColor,)
                    )),
                    backgroundColor: const MaterialStatePropertyAll(Colors.white)
                ),
                child: Text('الغاء', style: TextStyle(color:MyTheme.mainPurpleColor,
                    fontWeight: FontWeight.w500,fontSize: 20.spMin,fontFamily: 'IBM Plex Sans Arabic'
                ),),
              ),
            ),
            SizedBox(width: 10.w,),
            Container(
              color: Colors.transparent,
              height: 55,
              width: 150,
              child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(4),
                    shadowColor: const MaterialStatePropertyAll(Colors.black54),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    )),
                    backgroundColor: const MaterialStatePropertyAll(MyTheme.mainPurpleColor)
                ),
                child: Text('تفعيل', style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w500,fontSize: 20.spMin,fontFamily: 'IBM Plex Sans Arabic'
                ),),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
