import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/core/resources/colors_manger.dart';
import 'package:ishop/core/resources/strings_manger.dart';

import '../../../../main.dart';
import '../../domain/entities/products_entity.dart';

import '../bloc/products_bloc.dart';
import '../bloc/products_state.dart';
import 'HomeWidgets.dart';

class SearchScreen extends StatefulWidget {

   SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
final  searchController= TextEditingController();
bool _isSearching =false;
final List< ProductsEntity> products=[];
late List<ProductsEntity> searchedForProduct;
class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    // final userslist = ref.watch(ListOfUsersProvider);
    // List<UserData> searchlist = [];
    mq = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xFFE83070),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: buildAppActions(),
          leading: _isSearching?const BackButton( color: ColorsManger.grey,):Container(),
          title:_buidSearchField(),
          ),


        body: _buildBody(context),
        );

  }
  Widget _buidSearchField(){
    return   TextFormField(
        controller: searchController,
        cursorColor:  ColorsManger.darkPrimary,

        obscureText: false,
        onChanged: (searchedProduct) {
      //to make filter when search
      addSearchedItemToSearchedList(searchedProduct);
      // setState(() {
      //   searchedProduct = searchController.text;
      //
      // });
    },
        keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      hintText: "Search for products...",
      hintStyle: TextStyle(color: ColorsManger.lightGrey),

    ),
    style:Theme.of(context).textTheme.titleSmall);
  }
  void addSearchedItemToSearchedList(String searchedProduct) {
    searchedForProduct = products.where((product1) =>
        product1.title!.toLowerCase().startsWith(searchedProduct)).toList();

setState(() {

});

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
  _buildBody(BuildContext context){
    return BlocBuilder<ProductsBloc,ProductsState>(
      builder:(_,state) {
        if (state is RemoteProductsLoading) {
          return const Center(child: CupertinoActivityIndicator(),);
        }   if (state is RemoteProductsError) {
          return const Center(child: Icon(Icons.refresh),);
        }
        if (state is RemoteProductsDone) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: MediaQuery
                  .of(  context)
                  .size
                  .height /1.3
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
                  itemCount:searchController.text.isNotEmpty?state.products!.length:state.products!.length // Number of products
                  ,itemBuilder: (context, index) {
                    return HomeWidgets(products: searchController.text.isNotEmpty?state.products![index]:state.products![index],);
                  }
              ),
            ),
          );
        }
        return const SizedBox();
      },);
  }



}


