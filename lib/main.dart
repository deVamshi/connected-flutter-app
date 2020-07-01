import 'package:flutter/material.dart';
import 'package:Connected/Views/HomePage.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(  
    theme: ThemeData(appBarTheme: AppBarTheme(color:Color(0xff2b2f77) )  ),
    
    debugShowCheckedModeBanner: false,home:HomePage(),));
}


