import 'package:equatable/equatable.dart';

import '../../../home/data/models/products.dart';

class CategoryEntity  extends Equatable{
  int? id;
  String? title;
  double? price;
  String ?description;
  Category? category;
  String ?image;
  Rating? rating;
  CategoryEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
    rating,

  ];

}
