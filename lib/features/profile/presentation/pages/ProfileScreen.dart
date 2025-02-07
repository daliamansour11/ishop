import 'package:flutter/material.dart';
import 'package:ishop/core/util/BottomNaivgation.dart';
import 'package:ishop/features/home/presentation/pages/home.dart';

import '../widgets/profile_item.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigation()));
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Profile Picture
          const  Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // استبدل بالرابط الخاص بالصورة
                  ),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.edit, size: 15, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Name
         const   Text(
              'Nasir Uddin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Profile Details
            ProfileItem(
              icon: Icons.person,
              text: 'Nasir Uddin',
              onPressed: () {},
            ),
            ProfileItem(
              icon: Icons.email,
              text: 'nasirahamed4488@gmail.com',
              onPressed: () {},
            ),
            ProfileItem(
              icon: Icons.lock,
              text: '********',
              onPressed: () {},
            ),
            ProfileItem(
              icon: Icons.location_on,
              text: 'Sirajganj, Bangladesh',
              onPressed: () {},
            ),
            // Support
            ListTile(
              leading: Icon(Icons.support_agent, color: Colors.blue),
              title: Text('Support'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            // Log Out
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Log Out'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
