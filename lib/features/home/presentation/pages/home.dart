 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ishop/cofig/theme/themeData.dart';
import 'package:ishop/core/resources/strings_manger.dart';
import 'package:ishop/core/resources/values_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/util/drawerWidget.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_state.dart';
import '../widgets/HomeWidgets.dart';
import '../widgets/SearchUser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 final  searchController= TextEditingController();
  bool _isSearching =false;
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _biludAppBar(context),
      body:  Expanded(
        child: Column(
          children: [
            _buildscesrchedField(context),

            // SearchScreen(),
           const SlideShowImage(),

          const  SizedBox(height: 10,),
         // const   Buttons(),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',

                    style: Theme.of( context).textTheme.titleMedium,
                  ),
                  TextButton(onPressed: () {}, child: Text('View All', style: Theme.of( context).textTheme.titleSmall,)),
                ],
              ),
            ),
            _buildBody(context)
          ],
        ),
      ),
      endDrawer: DrawerWidget(),

    );
  }

  _biludAppBar(BuildContext context){
    var _isSearch =false;
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Container(
        width: MediaQuery.of(context).size.width,
        child:const Padding(
          padding:  EdgeInsets.only(top: 12.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 58.0,
                    bottom: 5,
                  ),
                  child: Text(AppString.home_appBar,
                    style: TextStyle(
                        color: ColorsManger.darkPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // SizedBox(width: 76,),
                // Text( "Home", style: TextStyle(color: Colors.white,fontSize: 23),),
              ],
            ),
          ),
        ),
      ),
      centerTitle: true,

   leading:    Padding(
        padding:  EdgeInsets.all(AppPadding.p4),
        child: InkWell(
          onTap: (){
            ZoomDrawer.of(context)!.toggle();
            // _scaffoldKey.currentState!.openDrawer();
          },
          child: CircleAvatar(
            radius: 35,

            backgroundImage:AssetImage("assets/images/onboarding_img.jpg"),
          ),)),


      actions: [

        // IconButton(
        //   onPressed: () async {
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
        //   },
        //   icon:
        // const  Icon(Icons.search, color: Colors.black),
        // ),

        IconButton(
          onPressed: () async {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SearchUser()));
          },
          icon:const Icon(Icons.shopping_cart, color: Colors.black),
        ),
        IconButton(
          onPressed: () async {},
          icon:
          Icon(Icons.notification_important_rounded, color: Colors.black),
        ),
      ],

    );
  }

  _buildBody(BuildContext context){
    return BlocBuilder<ProductsBloc,ProductsState>(
      builder:(_,state) {
        if (state is RemoteProductsLoading) {
          return const Center(child: CupertinoActivityIndicator(),);
        }   if (state is RemoteProductsError) {
          return const Center(child: Icon(Icons.refresh),);
        }
        if (state is RemoteProductsDone) {
          return Container(
            height: MediaQuery
                .of(  context)
                .size
                .height /2.68444477
            ,
            child: GridView.builder(
                // physics:const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.products!.length, // Number of products
                itemBuilder: (context, index) {
                  return HomeWidgets(products: state.products![index],);
                }
            ),
          );
        }
        return const SizedBox();
      },);
    }

  _buildscesrchedField(BuildContext context){
   return   TextFormField(
     style: Theme.of(context).textTheme.titleSmall,
     controller: searchController,
     obscureText: false,
     onChanged: (value) {
       addSearchedItemToSearchedList(value);

       setState(() {
         value = searchController.text;
         // searchlist=  data.data.where((element) => element.name == "sam").toList();
       });
     },
     keyboardType: TextInputType.text,
     decoration:const InputDecoration(

       focusedBorder: OutlineInputBorder(
         borderSide: BorderSide(
           color: ColorsManger.primary,
           width: 1,
         ),
         borderRadius: BorderRadius.all(Radius.circular(10)),
       ),
       hintText: "Search here...",
       contentPadding:
       EdgeInsets.symmetric(vertical: 7, horizontal: 5),

       suffixIcon: InkWell(child:

       Icon(Icons.search)),
       //prefix iocn
       hintStyle: TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.w500,
           color: ColorsManger.primary),
       //hint text style
       labelStyle: TextStyle(
           fontSize: 10, color: Colors.redAccent), //label style
     ),
   );
  }
  List<Widget> buildAppActions() {
    if (_isSearching) {
      return [
        IconButton(onPressed: () {
          _clearSearch();
          Navigator.pop(context);
        }, icon: const Icon(Icons.clear, color: ColorsManger.primary,))
      ];
    } else {
      return [
        IconButton(onPressed: () {
          return _startSearch();
        }, icon: const Icon(Icons.search, color: ColorsManger.grey,))
      ];
    }
  }

 void addSearchedItemToSearchedList(String searchedProduct) {
   searchedForProduct = products.where((product1) =>
       product1.title!.toLowerCase().startsWith(searchedProduct)).toList();
   //
   // setState(() {
   //
   // });

 }


 void _startSearch() {
   ModalRoute.of(context)!.addLocalHistoryEntry(
       LocalHistoryEntry(onRemove: _stopSearching));
   setState(() {
     _isSearching = true;
   });
 }

 void _stopSearching() {
   _clearSearch();
   setState(() {
     _isSearching=false;
   });
 }
 void _clearSearch(){
   searchController.clear();
 }


 }





