import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/products_entity.dart';
import '../widgets/details_widget.dart';


// class ProductsDetailsScreen extends StatelessWidget {
//   ProductsEntity productsEntity;
//   ProductsDetailsScreen({super.key,required this.productsEntity});
//   @override
//   Widget build(BuildContext context) {
//    return  Scaffold(
//      backgroundColor: ColorsManger.lightPrimary,
//      body:
//
//      CustomScrollView(
//        slivers: [
//          buildSliverAppBar(context),
//        ],
//
//      ),
//
//      // Image.network("${productsEntity.image}"),
//    );
//   }
//   Widget buildSliverAppBar(BuildContext context){
//     return SliverAppBar(
//       expandedHeight: 500,
//       pinned: true,
//       stretch: true,
//       backgroundColor: ColorsManger.lightPrimary,
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text(
//           productsEntity.title??"",
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         background: Hero(
//           tag: productsEntity.id!??0,
//           child:Image.network("${productsEntity.image}",fit:BoxFit.fill ,),
//
//         ),
//       ) ,
//     );
//   }
//
// }

class ProductDetailsPage extends StatelessWidget {
  ProductsEntity products;

  ProductDetailsPage({super.key,  required this.products});
  @override
  Widget build(BuildContext context) {
    bool isFavorite=true;
    return Scaffold(
        appBar: AppBar(
          leading:  IconButton(icon:  Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },),
          title:const Text('Product Details'),
          centerTitle: true,
          actions: [Padding(
            padding: EdgeInsets.only(right: 14.0),
            child:  IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                // Toggle the "favorite" state
                isFavorite = !isFavorite;
              }))],
        ),
        body:Container(
          child: SingleChildScrollView(
            child:DetailsWidget(products: products,),
          ),
        )
    );
  }


}



