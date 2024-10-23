

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishop/core/resources/colors_manger.dart';
import 'package:ishop/features/category/domain/entity/categor_entity.dart';

import '../../../home/domain/entities/products_entity.dart';

class ProductCard extends StatelessWidget {
  final CategoryEntity? products;

  const ProductCard({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: ColorsManger.white,
        child: ListTile(
          leading: Container(

              width: 100,
              child: Image.network(products!.image!,fit: BoxFit.fill,)),
          title: Text(products!.title!??"", style: Theme.of( context).textTheme.titleSmall,
          maxLines: 2,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("${products!.description??0}"),
              SizedBox(height: 3,),
              Text('\$${products!.price??0}',style: Theme.of( context).textTheme.bodySmall)
            ],
          ),
          trailing:const Icon(Icons.add_shopping_cart,color: ColorsManger.darkPrimary,) ,
          onTap: () {
            // Handle item tap, such as navigating to the product details
          },
        ),
      ),
    );
  }
}
