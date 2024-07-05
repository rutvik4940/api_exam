import 'package:api_exam/screen/home/provider/home_provider.dart';
import 'package:api_exam/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HomeProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: app_routs,
        ),
      )
  );
}