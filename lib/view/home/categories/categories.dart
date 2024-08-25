import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/view/custom_widgets/searchTextField.dart';
import 'package:food_app/view/home/bloc/food_bloc.dart';
import 'package:food_app/view/home/categories/burgerScreen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.1),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 25.spMin,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text('الفئات', style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w500,
            fontFamily: 'IBM Plex Sans Arabic',
          ),
        ),
      ),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoaded) {
            final filteredCategories = state.categoriesFood.where((food) {
              return food.name.toLowerCase().contains(searchQuery);
            }).toList();
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                   SearchTextField(
                     onChanged: (value){
                       setState(() {
                         searchQuery = value.trim().toLowerCase();
                       });
                     },
                   ),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: filteredCategories.length,
                      itemBuilder: (BuildContext context, int index) {
                        final food = filteredCategories[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                const BurgerScreen()));
                              },
                              child: ClipOval(
                                child: Image.network(
                                  width: 80,
                                  height: 80,
                                  food.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              food.name,
                              style: TextStyle(
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'IBM Plex Sans Arabic',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FoodInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
