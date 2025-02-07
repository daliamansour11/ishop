import 'package:flutter/material.dart';
import 'package:ishop/core/resources/strings_manger.dart';
import 'package:ishop/core/resources/values_manger.dart';

import '../../../../core/util/BottomNaivgation.dart';
import '../../../../core/resources/colors_manger.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.white,
        title:const Text(AppString.favourite,style: TextStyle(fontSize: AppSize.s25,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading:  IconButton(icon:Icon(Icons.arrow_back), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavigation()));
        },),
      ),
      body: _buildFavouriteList()


    );
  }

  Widget _buildFavouriteList(){
    return  ListView.builder(
      shrinkWrap: true,
      // physics:const n(),
      itemBuilder: (context,int index){
        return Card(
            margin:const EdgeInsets.all(5),
            color: Colors.white,

            child:    ListTile(
              leading:const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg"),
              ),
              title:const Padding(
                padding:  EdgeInsets.only(top:AppPadding.p8),
                child: Text("ADIDAS Bag ",style: TextStyle(fontSize: AppSize.s18,fontWeight: FontWeight.w700),),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  SizedBox(height: AppSize.s13,),
                  const  Padding(
                    padding:  EdgeInsets.only(right: AppPadding.p75),
                    child: Text(" price: 300EGP",style: TextStyle(fontSize: AppSize.s1,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: AppSize.s15,),

                  Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        TextButton(
                          onPressed: () {
                            // sign up functionality
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavigation()));
                          },
                          style: TextButton.styleFrom(
                            padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 9), backgroundColor: ColorsManger.primary,
                            shape: RoundedRectangleBorder(
                              side:const BorderSide(color: ColorsManger.primary),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child:const Text(AppString.add_to_cart,
                            style: TextStyle(fontSize: AppSize.s16, color: ColorsManger.white),
                          ),
                        ),
                        IconButton(onPressed: (){

                        }, icon:const Icon(Icons.delete,size: AppSize.s28,color: ColorsManger.primary,))
                      ]
                  )
                ],
              ),

            ),
        );


      }, itemCount: 9,);
  }
}
