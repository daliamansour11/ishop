


import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ProfileItem({super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
         const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style:  TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.grey),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

