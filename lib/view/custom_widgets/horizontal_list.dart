import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/myTheme.dart';
import 'package:food_app/view/home/product-details.dart';
import '../home/bloc/food_bloc.dart';

class HorizontalProductsList extends StatelessWidget {
  final Color color;

  const HorizontalProductsList({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FoodLoaded) {
            final products = state.foodProducts;
            if (products.isEmpty) {
              return const Center(child: Text("No products available"));
            }
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      const ProductsDetailsScreen()
                      ));
                    },
                    child: Container(
                      height: 180,
                      width: 160,
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
                          Stack(
                            children: [
                              SizedBox(
                                height: 140,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25,bottom: 5,right: 5,left: 5),
                                  child: Image.network(product.image, fit: BoxFit.contain,height: 50,width: 50,),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 5,
                                child: Row(
                                  children: [
                                    Text(product.rating.toString(),style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.spMin
                                    ),),
                                    SizedBox(width: 2.w,),
                                    Icon(Icons.star,size: 20.spMin, color: Colors.yellow),
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
                          SizedBox(height: 8.h),
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
                          SizedBox(height: 5.h),
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
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Error loading products"));
          }
        },
      ),
    );
  }
}
