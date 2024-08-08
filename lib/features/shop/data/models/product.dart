import 'package:hive/hive.dart';
import 'package:simple_ecommerce/features/shop/data/models/category.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final Category category;
  @HiveField(5)
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final imageList = List<String>.from(json['images']);
    if(imageList[0].startsWith('[')){
      imageList[0] = imageList[0].substring(1);
    }
    if(imageList.last.endsWith(']')){
      imageList.last = imageList.last.substring(0, imageList.last.length - 1);
    }
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: (json['price'] as int).toDouble(),
      description: json['description'],
      category: Category.fromJson(json['category']),
      images: imageList,
    );
  }
}
