

import 'package:flutter/material.dart';

extension Routering on BuildContext{

   pushNamed(Widget  screen){
    Navigator.push(this, MaterialPageRoute(builder: (_)=>screen));
   }

}