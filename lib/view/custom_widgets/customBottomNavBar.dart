import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/MyTheme.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count >= 1) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double buttonWidth = (width / 2.5);
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 53.h,
                    child: FloatingActionButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(Icons.check, color: Colors.black, size: 17.spMin,),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Text('تمت إضافة العنصر إلى السله', style: TextStyle(color: Colors.white,fontFamily: 'IBM Plex Sans Arabic',
                                  fontSize: 18.spMin,fontWeight: FontWeight.w500
                              ),),
                            ],
                          ),
                            showCloseIcon: true,
                          ),
                        );
                        _incrementCount();
                      },
                      elevation: 0,
                      backgroundColor: MyTheme.mainPurpleColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.spMin)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.spMin,
                            child: Icon(Icons.shopping_bag_outlined, size: 20.spMin, color: Colors.white,),
                          ),
                          SizedBox(width: 3.w,),
                          Flexible(
                            child: Text('أضف الي السله', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.spMin, fontFamily: 'IBM Plex Sans Arabic'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: buttonWidth / 2,
                      height: 30.h,
                      child: InkWell(
                        onTap: _incrementCount,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle,
                          ),
                          child: SizedBox(
                            width: 15.spMin,
                            height: 15.spMin,
                            child: Icon(Icons.add, size: 15.spMin, color: Colors.black,),
                          ),
                        ),
                      ),
                    ),
                    Text('$_count', style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w500, fontFamily: 'IBM Plex Sans Arabic'),),
                    SizedBox(
                      width: buttonWidth / 2,
                      height: 30.h,
                      child: InkWell(
                        onTap: _decrementCount,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle,
                          ),
                          child: SizedBox(
                            width: 15.spMin,
                            height: 15.spMin,
                            child: Icon(Icons.remove, size: 15.spMin, color: Colors.black,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}