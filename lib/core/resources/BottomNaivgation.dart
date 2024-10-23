

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ishop/core/resources/colors_manger.dart';

import '../../features/cart/presentation/pages/CartScreen.dart';
import '../../features/category/presentation/pages/categoryScreen.dart';
import '../../features/favaourite/presentation/pages/favourite_screen.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/profile/presentation/pages/ProfileScreen.dart';



class BottomNavigation extends StatefulWidget  {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  String? tittle;
  int _curvedIndex = 0;
  List<Widget>bottomNavScreen = <Widget>[
  const  HomePage(),
       // CategoryScreen(),
  ];
  void _changeItem(int value) {
    print(value);
    setState(() {
      _curvedIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: ColorsManger.white,
        backgroundColor: ColorsManger.white,
        color: ColorsManger.lightPrimary2,
        height: 55,
        items: const [
          Icon(Icons.home,size: 25,color: ColorsManger.darkPrimary,),
          Icon(Icons.category,size: 25,color: ColorsManger.darkPrimary),
          Icon(Icons.shopping_cart,size: 25,color:ColorsManger.darkPrimary,),
          Icon(Icons.favorite_border,size: 25,color:ColorsManger.darkPrimary),
          // Icon(Icons.person_pin,size: 38,color: ColorsManger.darkPrimary,),
        ],
        onTap: _changeItem,
        index: _curvedIndex,),
      body:
      // John@gmail.com
//johnd
//       m38rmF$

      IndexedStack(
        index: _curvedIndex,
        children: [
         const HomePage(),
            // CategoryScreen(),
          const Cartscreen(),
         const FavouriteScreen(),
          const ProfileView()

        ],
      ),

    );
  }


}






















// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:tasksapp/shikrsplus/presentation/chat/screens/detailsscreen.dart';
// import 'package:tasksapp/shikrsplus/presentation/chat/screens/profile.dart';
//
// import 'Addtask.dart';
// import 'HomeChat.dart';
// import 'homescreen.dart';
// import 'no
// tification.dart';
//
// class Bottomnavigation extends StatefulWidget{
//   @override
//   State<Bottomnavigation> createState() => _BottomnavigationState();
// }
//
// class _BottomnavigationState extends State<Bottomnavigation> {
//   final screens=[
//     HomeScreen(),
//     Chatscreen(),
//     AddTaskScreen(),
//     Notificationscreen(),
//     Profilescreen()
//   ];
//   int index=0;
//   final navigationkey=GlobalKey<CurvedNavigationBarState>();
//   @override
//   Widget build(BuildContext context) {
//     final items=<Widget>[
//       Icon(Icons.home,size: 30,),
//       Icon(Icons.chat,size: 30,),
//       Icon(Icons.add,size: 30,),
//       Icon(Icons.calendar_today_rounded,size: 30,),
//       Icon(Icons.person,size: 30,),
//     ];
//     return SafeArea(
//       top: false,
//       child: ClipRect(
//         child: Scaffold(
//           body:screens[index] ,
//           bottomNavigationBar: Theme(
//             data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.white)),
//             child: CurvedNavigationBar(
//               key: navigationkey,
//               animationCurve: Curves.easeInOut,
//               animationDuration: Duration(milliseconds: 300),
//               //  backgroundColor: Colors.red,
//               color: Colors.black38,
//               //  buttonBackgroundColor: Colors.blue,
//               items: items,
//               index: index,
//               height: 60,
//               onTap: (index){this.index=index;},),
//           ),
//         ),
//       ),
//     );
//   }
// }