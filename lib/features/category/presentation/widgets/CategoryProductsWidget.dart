



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CategoryProductsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:_categoryProducts(context) ,
   )
;  }
 Widget _categoryProducts(BuildContext context){

    return
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: InkWell(
            // onTap: (){
            //
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => SearchUser()));
            // },
            child: Container(
              height: 45,
              margin: EdgeInsets.only(top: 2),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0, 0.50))
                ],
              ),
              child: Expanded(
                flex: 1,
                child:  TextField(
                    onChanged: (value) {
                    },
                    decoration: InputDecoration(
                        hintText:'what are you looking for..',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon:
                           InkWell(
                               // onTap: (){
                               //   Navigator.push(
                               //       context,
                               //       MaterialPageRoute(
                               //           builder: (context) => SearchUser()));
                               // },
                               child: Icon(Icons.search))),
                  ),
                ),
              ),
          ),
          ),

        SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 90,
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 10),
                  sliver: SliverGrid.count(
                    childAspectRatio: (.8992),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200]),
                        child:
                             InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 65,
                                  decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[300],
                                      image: DecorationImage(
                                          image: NetworkImage("https://th.bing.com/th/id/R.b0941ae049cfe1242b875ee0ea722236?rik=TmhTt6vbVP7Rsg&riu=http%3a%2f%2fwww.lionleaf.com%2fwp-content%2fuploads%2f2014%2f11%2f1415275_22821821.jpg&ehk=7bK0H1iqq%2fkS48m0bbON6BfPoegjSZFfXu%2bC3ztcrvI%3d&risl=&pid=ImgRaw&r=0"),
                                          fit: BoxFit.cover ),
                                  ),
                                  child: Column(
                                      children: [
                                  Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 8, bottom: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: Colors.grey[200]),
                                        child: Center(
                                          child: Text(
                                            "50%",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 8, right: 8.0),
                                        child: InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                             ] ),
                            ),


                      ));
                    }),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );


 }

}