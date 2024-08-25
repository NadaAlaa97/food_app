import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({super.key, required this.currentIndex, required this.onItemTapped,});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BottomNavigationBar(
        selectedFontSize: 12.spMin,
        unselectedFontSize: 12.spMin,
        selectedLabelStyle: TextStyle(fontSize: 16.spMin,fontFamily: 'IBM Plex Sans Arabic',fontWeight: FontWeight.w400),
        unselectedLabelStyle: TextStyle(fontSize: 16.spMin,fontFamily: 'IBM Plex Sans Arabic',fontWeight: FontWeight.w400),
        iconSize: 24.spMin,
        elevation:4 ,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.other_houses_sharp,
            color: widget.currentIndex == 0 ? MyTheme.mainPurpleColor: Colors.grey,
          ),
            label: 'الرئيسيه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined,
              color: widget.currentIndex == 1 ? MyTheme.mainPurpleColor : Colors.grey,
            ),
            label: 'أكلات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_transportation,
              color: widget.currentIndex == 2 ? MyTheme.mainPurpleColor : Colors.grey,
            ),
            label: 'رحلاتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded,
              color: widget.currentIndex == 3 ? MyTheme.mainPurpleColor : Colors.grey,
            ),
            label: 'متاجر',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
              color: widget.currentIndex == 4 ? MyTheme.mainPurpleColor : Colors.grey,
            ),
            label: 'الحساب',
          ),
        ],
        currentIndex: widget.currentIndex,
        selectedItemColor: MyTheme.mainPurpleColor,
        unselectedItemColor: Colors.grey,
        onTap: widget.onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}