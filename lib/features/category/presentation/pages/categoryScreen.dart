import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/core/resources/colors_manger.dart';
import 'package:ishop/core/resources/strings_manger.dart';

import '../../../home/data/remote_dataSourse/productApiService.dart';
import '../../../home/presentation/pages/home.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_event.dart';
import '../bloc/category_state.dart';
import '../widgets/category_widgets.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoriesPage> {
  ProductApiService? _category;
  var selectedCategory ;
  final List<String> categories = [
    'electronics',
    'jewelery',
    'men\'s clothing',
    'women\'s clothing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppString.category_appBar_Tittle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
            if (state is RemoteCategoryLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state is RemoteCategoryError) {
              return const Center(
                child: Icon(Icons.refresh),
              );
            }
            if (state is RemoteCategoryDone) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.maincategory_Tittle,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.products!.length,
                            itemBuilder: (context, index) {
                              var isSelected = false;
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ChoiceChip(
                                  // labelStyle: TextStyle(
                                  // color: isSelected ? Colors.white : Colors.black, // Adjust text color
                                  // ),
                                  backgroundColor: isSelected
                                      ? ColorsManger.darkPrimary
                                      : ColorsManger.white,
                                  // Adjust background color
                                  selectedColor: ColorsManger.darkPrimary,
                                  // isSelected ? Colors.white : Colors.black,

                                  label: Text(
                                   "${ state.products![index].category}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),
                                  selected:
                                      selectedCategory == state.products![index],
                                  onSelected: (selected) {
                                    setState(() {
                                      selectedCategory =  state.products![index].category;
                                      // state.products![index];
                                      // CategoryBloc().add(GetCategories()
                                      //     .CategoryClick(
                                      //     categories[index]));
                                    });
                                  },
                                ),
                              );
                            })),
                    SizedBox(height: 16),

                  ]);
            }

            return SizedBox();
          }),
        ));
  }
}
//
// import 'package:flutter/material.dart';
//
// class CategoriesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'All Categories',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: false,
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.black),
//           onPressed: () {},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.black),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Categories',
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.shopping_bag),
//               title: Text('For You'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.local_grocery_store),
//               title: Text('Grocery'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.checkroom),
//               title: Text('Fashion'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.tv),
//               title: Text('Appliances'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.smartphone),
//               title: Text('Mobiles'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.electrical_services),
//               title: Text('Electronics'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.chair),
//               title: Text('Furniture'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Popular Stores
//               Text(
//                 'Popular Stores',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: 8, // Adjust based on items
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Colors.grey.shade200,
//                         child: Icon(Icons.store, size: 30),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         'Store $index',
//                         style: TextStyle(fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               // Recently Viewed Stores
//               Text(
//                 'Recently Viewed Stores',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                     10,
//                         (index) => Container(
//                       width: 100,
//                       margin: EdgeInsets.only(right: 10),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.grey.shade200,
//                             ),
//                             child: Icon(Icons.shopping_bag, size: 40),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             'Item $index',
//                             style: TextStyle(fontSize: 12),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


