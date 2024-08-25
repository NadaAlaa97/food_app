
class Food {
  final String name;
  final String description;
  final double price;
  final String image;
  final double rating;
  final String iconImage;

   Food({required this.name, required this.price, required this.image, required this.rating,required this.description,
   this.iconImage = ''
   });
}