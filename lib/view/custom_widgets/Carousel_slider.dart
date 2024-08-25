import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/myTheme.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final List<String> images = ['assets/images/img.png', 'assets/images/img.png', 'assets/images/img.png',];

  int _currentPage = 0;

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 5),
          child: CarouselSlider(
            items: images.map((e) => Container(
              width: 343.sw,
              height: 150.sh,
              decoration: BoxDecoration(
                color: MyTheme.mainPurpleColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Image.asset(e,
                fit: BoxFit.fill,
              ),)).toList(),

            options: CarouselOptions(
                height: 150.h,
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (value, _) {
                  setState(() {
                    _currentPage = value;
                  });
                }
            ),
          ),
        ),
        buildCarouselIndicator()
      ],
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < images.length; i++)
          Container(
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            margin: EdgeInsets.all(4.spMin),
            decoration: BoxDecoration(
              color: i == _currentPage ? MyTheme.mainPurpleColor : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}