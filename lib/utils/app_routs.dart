import 'package:api_exam/screen/cart/view/cart_screen.dart';
import 'package:api_exam/screen/home/view/home_screen.dart';
import 'package:api_exam/screen/product/view/product_screen.dart';
import 'package:api_exam/screen/splash/view/spalsh_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder>app_routs={
  "/":(context) => const SplashScreen(),
  "home":(context) => const HomeScreen(),
  "product":(context) => const ProductScreen(),
  "cart":(context) => const CartScreen()


};