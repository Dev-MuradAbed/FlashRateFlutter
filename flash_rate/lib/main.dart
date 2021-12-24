import 'package:flash_rate/theme.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      bool isDarkModeEnabled = false;
 
    return MaterialApp(
       themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
    debugShowCheckedModeBanner: false,
    
      home: const bottomNavigationBar(),
    );
  }
}
