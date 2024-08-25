import 'package:flutter/material.dart';
import 'package:food_app/view/food-categories/foodScreen.dart';
import 'package:food_app/view/home/home-screen-body.dart';
import 'package:food_app/view/my-trips/tripsScreen.dart';
import 'package:food_app/view/profile/profileScreen.dart';
import 'package:food_app/view/shops/shops-screen.dart';

import '../custom_widgets/bottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreenBody(),
    const FoodCategoriesScreen(),
    const TripsScreen(),
    const ShopsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: _selectedIndex, onItemTapped: _onItemTapped,),
      ),
    );
  }
}