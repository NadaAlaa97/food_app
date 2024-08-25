part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}
final class LoadFoodEvent extends FoodEvent {}


class SelectChipEvent extends FoodEvent{
  final int selectedIndex;
  SelectChipEvent(this.selectedIndex);
}