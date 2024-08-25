import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';

class RowSection extends StatefulWidget {
  final String text;
  final String textTwo;
  final VoidCallback onTap;
  IconData? icon;

  RowSection({super.key, required this.text, required this.textTwo, required this.onTap, this.icon });

  @override
  _RowSectionState createState() => _RowSectionState();
}

class _RowSectionState extends State<RowSection> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IBM Plex Sans Arabic',
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 2.w,),
              Icon(widget.icon, size: 25.spMin,color: Colors.orange,)
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isTapped = !_isTapped;
              });
              widget.onTap();
            },
            child: Text(
              widget.textTwo,
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w500,
                fontFamily: 'IBM Plex Sans Arabic',
                color: _isTapped ? MyTheme.mainPurpleColor : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
