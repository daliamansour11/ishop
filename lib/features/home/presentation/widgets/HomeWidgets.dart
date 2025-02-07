
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ishop/core/resources/values_manger.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../domain/entities/products_entity.dart';
import '../pages/productsDetailsScreen.dart';

class HomeWidgets extends StatelessWidget {
  final ProductsEntity? products;
  final ProductsEntity? productsSearchedList;

  const HomeWidgets({super.key, this.products, this.productsSearchedList}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .width /1.8,
      child: _productCard(context),

    );
  }

  Widget _productCard(BuildContext context) {
    bool  isFavorite=false;
    return  InkWell(
      onTap: (){


        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsPage(products:products!)));
      },
      child: Card(
        // color: ColorsManger.semiGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Hero(
          tag: products!.id!??0,
          child: Container(
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Image widget to display the picture
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: _buildImage(context),
                    ),
                   Positioned(
                      top: 2,
                      right: 4,
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
                SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p10),
                  child: Text(products!.title!??"",maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of( context).textTheme.titleSmall,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p10),
                  child: Text("\$"+"${products!.price!??0.0}",style: Theme.of( context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget _buildImage(BuildContext context){

  return CachedNetworkImage(
    imageUrl: products!.image!,
      imageBuilder: (context,ImageProvider)=>ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
              color: ColorsManger.grey,
              image: DecorationImage(
                  image: ImageProvider,
                  fit: BoxFit.fill
              )
          ),
        ),
      ),
    progressIndicatorBuilder: (context,url,downloadProgress)=>
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: ColorsManger.grey,

            ),
            child:  const CupertinoActivityIndicator(),
          ),
        ),
    errorWidget: (context, url, error) =>  ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: ColorsManger.grey,

        ),
        child:const Icon(Icons.error),
      ),
    ),
  );

}
  Widget _slideShowImage(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 166,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: Offset(0, 0.50))
            ],
          ),
          child: ImageSlideshow(
            indicatorColor: Colors.blue,
            onPageChanged: (value) {
              debugPrint('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/onboarding_img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/onboarding_img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/onboarding_img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

}
class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    var isSelected;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    FilterChip(
    label: Text('electronics',style: Theme.of(context).textTheme.titleSmall,),
     // selected: isSelected, // حالة الاختيار
    onSelected: (bool selected) {
    isSelected = selected; // تغيير الحالة لما يتضغط على الـ Chip
    },
    selectedColor: Colors.green, // اللون لما يكون مختار
    backgroundColor: ColorsManger.lightPrimary, // اللون لما يكون مش مختار
    labelStyle: TextStyle(color: Colors.white), // لون النص
    ),
        FilterChip(label: Text('jewelery',style: Theme.of(context).textTheme.titleSmall,), onSelected: (bool value) {}),
        FilterChip(label: Text('men',style: Theme.of(context).textTheme.titleSmall,), onSelected: (bool value) {}),
        FilterChip(label: Text('women',style: Theme.of(context).textTheme.titleSmall,), onSelected: (bool value) {}),
      ],
    );
  }
}

class SlideShowImage extends StatelessWidget {
  const SlideShowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child:   Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image:const DecorationImage(
            image: AssetImage(
                'assets/images/onboarding_img.jpg'), // Placeholder for banner image
            fit: BoxFit.cover,
          ),
        ),
        child:const Center(
          child: Text(
            'GET YOUR SPECIAL SALE\nUP TO 30%',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


