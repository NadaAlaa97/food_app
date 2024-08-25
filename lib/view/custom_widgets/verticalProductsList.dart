import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/myTheme.dart';
import '../home/bloc/food_bloc.dart';

class VerticalProductsList extends StatelessWidget {
  final Color color;

  const VerticalProductsList({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FoodLoaded) {
          final products = state.foodProducts;
          if (products.isEmpty) {
            return const Center(child: Text("No products available"));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.67,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 250,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow:  [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 7,
                          spreadRadius: 5
                      )
                    ],
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 170,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5,left: 5),
                                child: Image.network(product.image, fit: BoxFit.contain,height: 40,width: 40,),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                left: 1,
                                child: Row(
                                  children: [
                                    Text(product.rating.toString(),style: TextStyle(
                                        color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.spMin
                                    ),),
                                    SizedBox(width: 2.w,),
                                    Icon(Icons.star,size: 19.spMin, color: Colors.yellow),
                                  ],
                                )
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration:  BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
                                child: Icon(Icons.favorite_border, color: Colors.black, size: 20.spMin),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(product.name, style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.spMin,
                          color: Colors.black,
                        ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(product.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'IBM Plex Sans Arabic',
                            color: Colors.grey,
                            fontSize: 14.spMin,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10, bottom: 1),
                            child: Text('${product.price} \$ ',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 3),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyTheme.mainPurpleColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(Icons.add,color: Colors.white, size: 22.spMin),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("Error loading products"));
        }
      },
    );
  }
}