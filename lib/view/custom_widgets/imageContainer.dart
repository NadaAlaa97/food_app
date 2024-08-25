import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/MyTheme.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const ImageContainer({super.key, required this.imageUrl, required this.isSelected, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ?MyTheme.mainPurpleColor : Colors.grey,),
          borderRadius: BorderRadius.circular(10.spMin),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}