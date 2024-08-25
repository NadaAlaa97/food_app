import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/MyTheme.dart';
import 'package:food_app/view/custom_widgets/horizontal_list.dart';
import 'package:food_app/view/custom_widgets/row-section.dart';
import 'package:food_app/view/home/suggestedForYouScreen.dart';

import '../custom_widgets/customBottomNavBar.dart';
import '../custom_widgets/imageContainer.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  int _selectedImageIndex = 0;
  bool _isClicked = false;

  void _clickFavorite() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7tWKyw6zBuQzMffAxLeNgZco249Qn1VkN9w&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThWAMrZ5K-EcN1bIhaga01YOyEqnJuTOx7Gg&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ182m7lM3D0Z730RFVepZK42dsDcezLvUMzw&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmmnfUm32oK_-skRIBf0U4sfHn1OETgBQRyw&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4o0zJaovYIZN7Fqbw-sMQiinENv6bw0CW6Q&s',
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.withOpacity(0.2),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black, size: 25.spMin,),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                children: [
                  Container(
                    decoration:  BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2),),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          _clickFavorite();
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
                                Text('تمت إضافة العنصر إلى المفضلة', style: TextStyle(color: Colors.white,fontFamily: 'IBM Plex Sans Arabic',
                                    fontSize: 18.spMin,fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                              showCloseIcon: true,
                            ),
                          );
                        },
                        child: Icon(
                          _isClicked ? Icons.favorite : Icons.favorite_border,
                          color: _isClicked ? MyTheme.mainPurpleColor : Colors.black,
                          size: 22.spMin,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.share,
                          color: Colors.black,
                          size: 17.spMin,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 390.h,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEORM58QoOyxnGKc1xcARaP264UJLkE649hQ&s',
                    ), fit: BoxFit.fitWidth,),
                ),
              ),
              Container(
                height: 90.h,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5,left: 5),
                  child: Row(
                    children: List.generate(imageUrls.length, (index) {
                      return Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 2.5.h),
                        child: ImageContainer(
                            imageUrl: imageUrls[index],
                            isSelected: _selectedImageIndex == index,
                            onTap: (){
                              setState(() {
                                _selectedImageIndex = index;
                              });
                            }),
                      ));
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5,left: 7,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('تشيز برجر علي الفحم', style: TextStyle(color: Colors.black,fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 18.spMin,fontWeight: FontWeight.w500
                    ),),
                    Row(children: [
                      Text('(139)' ,style: TextStyle(color: Colors.grey,fontSize: 16.spMin,fontWeight: FontWeight.w400),),
                      SizedBox(width: 1.w,),
                      Icon(Icons.star, size: 11.spMin,color: Colors.yellow,),
                      SizedBox(width: 1.w,),
                      Text('4.5',style: TextStyle(color: Colors.black,fontSize: 16.spMin,fontWeight: FontWeight.w400),)
                    ],)
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text('ساندوتش', style: TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 16.spMin,fontFamily: 'IBM Plex Sans Arabic', color: Colors.grey
                ),),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text('600 \$', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 24.spMin ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('وصف الساندوتش', style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'IBM Plex Sans Arabic',fontSize: 18.spMin,color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('قطعتين لحمه ، مغطى بالجبنة الذائبة الإلزامية ومكدسة على لفائف ناعمة مع البصل والأفوكادو والخس والطماطم والمايونيز بالثوم',
                style: TextStyle(fontSize: 14.spMin,fontWeight: FontWeight.w400,fontFamily: 'IBM Plex Sans Arabic'),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RowSection(text: 'مقترحه لك', textTwo: 'عرض المزيد', onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                  const SuggestedScreen()
                  ));
                },),
              ),
              SizedBox(height: 5.h,),
             const HorizontalProductsList(color: Colors.white)
]
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}