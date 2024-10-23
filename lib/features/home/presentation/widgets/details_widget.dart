import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../domain/entities/products_entity.dart';

class DetailsWidget extends StatelessWidget {
  final ProductsEntity? products;
  const DetailsWidget (  {this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
  Widget _buildBody(BuildContext context ){
    return Column(
      children: [
        Container(
          height: 280,
          child: Image.network(products!.image??"",
            // Placeholder for the sneaker image
            fit: BoxFit.fill,
          ),
        ),
        const  SizedBox(height: 10),
        ListTile(
          title:Text(products!.title??"",
            maxLines: 1,
            style:Theme.of(context).textTheme.titleSmall,
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right:10,bottom: 30),
            child: Text(
              '\$${products!.price??0.0}',
              style:const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ),
          subtitle:  Text(
            '★ ${products!.rating!.count} | ${products!.rating!.rate} ',
            style:const TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(products!.description??"",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.start,
          ),
        ),
        const   SizedBox(height: 20),
        // Similar Products Section
        // Text(
        //   'Similar Products',
        //   style: Theme.of(context).textTheme.titleMedium,
        // ),
        // const SizedBox(height: 10),
        // BlocBuilder<ProductsBloc,ProductsState>(
        //   builder:(_,state) {
        //     if (state is RemoteProductsLoading) {
        //       return const Center(child: CupertinoActivityIndicator(),);
        //     }   if (state is RemoteProductsError) {
        //       return const Center(child: Icon(Icons.refresh),);
        //     }
        //     if (state is RemoteProductsDone) {
        //       return Container(
        //         height: MediaQuery
        //             .of(  context)
        //             .size
        //             .height /2.68444477
        //         ,
        //         child: ListView.builder(
        //             scrollDirection: Axis.horizontal,
        //             // physics:const BouncingScrollPhysics(),
        //             shrinkWrap: true,
        //             itemCount: state.products!.length, // Number of products
        //             itemBuilder: (context, index) {
        //               return SimilarProductWidget(productsEntity: state.products![index],);
        //             }
        //         ),
        //       );
        //     }
        //     return const SizedBox();
        //   },),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child:  Text('Add to Cart',style: Theme.of(context).textTheme.titleMedium,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManger.lightPrimary, // Light blue color
                  ),
                ),
              ),
              const    SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy Now'
                    ,style: Theme.of(context).textTheme.titleMedium,),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
class  SimilarProductWidget extends StatelessWidget {
  final ProductsEntity productsEntity;
  SimilarProductWidget({required this.productsEntity});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Card(
        margin: EdgeInsetsDirectional.only(bottom: 60),
        child: Column(
          children: [
            Image.network(productsEntity!.image!??"",
              height: 150,// Placeholder for similar product image
            ),
            SizedBox(height: 10),
            Text(
                '\$${productsEntity.price}',
                style: Theme.of(context).textTheme.titleSmall),

          ],
        ),
      ),
    );
  }

}