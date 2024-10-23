

import 'package:flutter/material.dart';
import 'package:ishop/core/resources/colors_manger.dart';
import 'package:ishop/core/resources/strings_manger.dart';
import 'package:ishop/core/resources/values_manger.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(AppString.cart_appBar,style:Theme.of( context).textTheme.titleLarge),
       leading: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back),),
        centerTitle: true,
      ),
      body: Container(

        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,int index){
            return Padding(
              padding: const EdgeInsets.only(left: AppPadding.p4,right: AppPadding.p4),
              child: Card(
                // color: Colors.grey[200],

                child: ListTile(
                  leading:const CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage("https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg"),
                  ),
                  title: Text("ADIDAS Bag ",style:Theme.of(context).textTheme.titleLarge,),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Padding(
                        padding:  EdgeInsets.only(right: AppPadding.p75,top: 6,bottom:AppPadding.p8),
                        child: Padding(
                          padding:  EdgeInsets.all(AppPadding.p4),
                          child: Text("Price: 300EGP",style:Theme.of(context).textTheme.titleLarge)
                        ),
                      ),

                      Row (
                          children:[
                            CircleAvatar(
                                radius: 11,
                                backgroundColor: ColorsManger.darkPrimary,
                                child:
                                InkWell(
                                    onTap: (){

                                    },
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Icon(Icons.maximize,size: 15,color: Colors.white,weight:23 ,),
                                    )))),
                            SizedBox(width: 5,),
                            Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),


                            InkWell(
                                onTap: (){

                                },
                                child:const Icon(Icons.add_circle ,color:ColorsManger.darkPrimary ,))
                          ]
                      )
                    ],
                  ),
                  trailing: InkWell(
                      onTap: (){
                      },
                      child: const Icon(Icons.delete,color: ColorsManger.darkPrimary,)),
                ),
              ),
            );
          }, itemCount: 9,),
      ),
    );
  }
}



