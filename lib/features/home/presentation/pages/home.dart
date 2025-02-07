 import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ishop/cofig/theme/themeData.dart';
import 'package:ishop/core/resources/strings_manger.dart';
import 'package:ishop/core/resources/values_manger.dart';
import '../../../../core/extensions/extentions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/util/drawerWidget.dart';
import '../../domain/entities/products_entity.dart';
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

  late List<ProductsEntity> searchedProducts;
 late List< ProductsEntity> products;
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _biludAppBar(context),
      drawer: const DrawerWidget(),
      body:  SingleChildScrollView(
        child: Column(
          children: [
        SizedBox(

          child: _buildSearchedField(context),
            ),

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


    );
  }

  _biludAppBar(BuildContext context){
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
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (_, state) {
        if (state is RemoteProductsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteProductsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteProductsDone) {
          products = state.products!; // تحديث قائمة المنتجات
          return Column(
            children: [
              Container(
          height: MediaQuery
                        .of(  context)
                        .size
                        .height /2.68444477
                    ,
                child: GridView.builder(
                  shrinkWrap: true,
                                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 0.7,
                                ),
                  itemCount: products.length ,
                  itemBuilder: (context, index) {
                    return HomeWidgets(products: products[index]);
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );


    }

  _buildSearchedField(BuildContext context){
   return   Padding(
     padding: const EdgeInsets.all(6.0),

       child: Container(

         decoration: BoxDecoration(
           color: ColorsManger.white,
           borderRadius: BorderRadius.circular(12.0),
           boxShadow:const  [
                BoxShadow(
               color: Colors.grey,
               blurRadius: 4,
               offset: Offset(0, 2),
             ),
           ],
         ),
         child:  TextField(
           controller: searchController,
           decoration:  InputDecoration(
             hintText: "Search...",
             border: InputBorder.none,
             contentPadding: EdgeInsets.symmetric(horizontal: 12.0),

             suffixIcon:  _isSearching?
         IconButton(onPressed: () {
         _clearSearch();
         Navigator.pop(context);
         }, icon: const Icon(Icons.clear, color: ColorsManger.primary,))
                      :
         IconButton(onPressed: () {
            context.pushNamed(SearchPage());
         }, icon: const Icon(Icons.search, color: ColorsManger.grey,))
           ),

                      ),
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

  // void addSearchedItemToSearchedList(String searchedProduct) {
  //   searchedForProduct = products;
  //
  //
  //   setState(() {
  //     _debouncer.run(() {
  //       if (searchedProduct.isEmpty) {
  //         print("Search input is empty");
  //         return;
  //       }
  //
  //       if (searchedProduct.length < 2) {
  //         print("Please enter at least 2 characters");
  //         return;
  //       }
  //
  //       // تنفيذ عملية البحث هنا
  //       searchedForProduct = products
  //           .where((product) =>
  //       product.title != null &&
  //           product.title!.toLowerCase().startsWith(searchedProduct.toLowerCase())).toList();
  //
  //       print("Searching for: $searchedProduct");
  //
  //       if (searchedForProduct.isEmpty) {
  //         print("No matching products found for: $searchedProduct");
  //       }
  //     });
  //
  //     // searchedForProduct = products
  //     //     .where((product) =>
  //     // product.title != null &&
  //     //     product.title!.toLowerCase().startsWith(searchedProduct.toLowerCase())).toList();
  //
  //
  //   });
  // }

  final _debouncer = _Debouncer(milliseconds: 500);

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      // تنفيذ عملية البحث هنا
      print("Searching for: $query");
    });
  }
 void _startSearch() {
   ModalRoute.of(context)!.addLocalHistoryEntry(
       LocalHistoryEntry(onRemove: _stopSearching));
   setState(() {
     _isSearching = true;
   });
 }

  _stopSearching() {
   _clearSearch();
   setState(() {
     _isSearching=false;
   });
 }
 void _clearSearch(){
   searchController.clear();
 }}




 class _Debouncer {
   final int milliseconds;
   VoidCallback? action;
   Timer? _timer;

   _Debouncer({required this.milliseconds});

   void run(VoidCallback action) {
     if (_timer != null) {
       _timer!.cancel();
     }
     _timer = Timer(Duration(milliseconds: milliseconds), action);
   }
 }
