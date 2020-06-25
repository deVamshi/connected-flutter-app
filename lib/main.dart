import 'package:flutter/material.dart';
import 'package:Connected/Views/HomePage.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(  
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.blueGrey)  ),
    
    debugShowCheckedModeBanner: false,home:HomePage(),));
}


