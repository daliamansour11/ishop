// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ishop/core/resources/colors_manger.dart';
// import 'package:ishop/core/resources/strings_manger.dart';
//
//
//
// import '../../../home/data/remote_dataSourse/productApiService.dart';
// import '../../../home/presentation/pages/home.dart';
// import '../bloc/category_bloc.dart';
// import '../bloc/category_event.dart';
// import '../bloc/category_state.dart';
// import '../widgets/category_widgets.dart';
//
// class CategoryScreen extends StatefulWidget {
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen> {
//   ProductApiService? _category;
//   String selectedCategory = 'Teakwood';
//   final List<String> categories = [
//     'electronics',
//     'jewelery',
//     'men\'s clothing',
//     'women\'s clothing'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(AppString.category_appBar_Tittle),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (context) => HomePage()));
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
//             if (state is RemoteCategoryLoading) {
//               return const Center(
//                 child: CupertinoActivityIndicator(),
//               );
//             }
//             if (state is RemoteCategoryError) {
//               return const Center(
//                 child: Icon(Icons.refresh),
//               );
//             }
//             if (state is RemoteCategoryDone) {
//               return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       AppString.maincategory_Tittle,
//                       style: Theme.of(context).textTheme.labelLarge,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                         height: 40,
//                         child: Expanded(
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: categories.length,
//                                 itemBuilder: (context, index) {
//                                   var isSelected = false;
//                                   return Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: ChoiceChip(
//                                       // labelStyle: TextStyle(
//                                       // color: isSelected ? Colors.white : Colors.black, // Adjust text color
//                                       // ),
//                                       backgroundColor: isSelected
//                                           ? ColorsManger.darkPrimary
//                                           : ColorsManger.white,
//                                       // Adjust background color
//                                       selectedColor: ColorsManger.darkPrimary,
//                                       // isSelected ? Colors.white : Colors.black,
//
//                                       label: Text(
//                                         categories[index],
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleSmall,
//                                       ),
//                                       selected:
//                                           selectedCategory == categories[index],
//                                       onSelected: (selected) {
//                                         setState(() {
//                                           selectedCategory = categories[index];
//                                           // state.products![index];
//                                           // CategoryBloc().add(GetCategories()
//                                           //     .CategoryClick(
//                                           //     categories[index]));
//                                         });
//                                       },
//                                     ),
//                                   );
//                                 }))),
//                     SizedBox(height: 16),
//                     Expanded(
//                         child: ListView.builder(
//                             itemCount: state.products!.,
//                             itemBuilder: (context, index) {
//                               return ProductCard(
//                                   products: state.products![index]);
//                             }))
//                   ]);
//             }
//
//             return SizedBox();
//           }),
//         ));
//   }
// }
