part of 'food_bloc.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}

final class FoodLoaded extends FoodState {
  final List<Food> foodProducts;
  final int selectedIndex;
  final List<Food> categoriesFood;

  FoodLoaded({required this.foodProducts, this.selectedIndex = 0,required this.categoriesFood});
}
