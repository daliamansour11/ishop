

import 'package:flutter/material.dart';

class textStyle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return     Text.rich(
       TextSpan(
          text: 'Ishop',
          style: TextStyle(color: Colors.black, fontSize: 20),
          children: <TextSpan>[


          ]
      ),
    );
  }

}