import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SearchTextField extends StatelessWidget {
   SearchTextField({super.key, required this.onChanged});
  ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10.spMin,right: 10.spMin),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 5),
              hintText: 'أنا أبحث عن ..........',
              hintStyle:  TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: 16.spMin,
              ),
              prefixIcon:  Icon(Icons.search_rounded, color: Colors.grey,size: 20.spMin,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.spMin),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.spMin),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.spMin),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.spMin),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              constraints: BoxConstraints.expand(width: 270.w,height: 45.h)
          ),
          onChanged: onChanged,

        ),
      ),
    );
  }
}