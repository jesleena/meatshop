import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meatshop/views/splashscreen.dart';
import '/controller/productprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        theme:  ThemeData(primarySwatch: Colors.green).copyWith(
            textTheme: TextTheme(
              displayLarge: TextStyle(fontSize: 25,fontFamily:'Amaranth', color:Colors.white,fontWeight: FontWeight.bold),
              displayMedium: TextStyle(fontSize: 25,fontFamily:'Amaranth', color:Colors.green,fontWeight: FontWeight.bold),
              displaySmall: TextStyle(fontSize: 20,fontFamily:'Amaranth', color:Colors.black),
              bodyLarge :TextStyle(fontSize: 18,fontFamily:'Amaranth',color:Colors.white ),
              bodyMedium: TextStyle(fontSize: 15,fontFamily:'Amaranth',color:Colors.black),
              bodySmall :TextStyle(fontSize: 15,fontFamily:'Amaranth',color:Colors.white ),
            )
        ),
        home: SplashPage(),
      ),
    ),
  );
}
