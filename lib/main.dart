import 'package:flutter/material.dart';
import 'package:login_signup/screens/login_screen.dart';

import 'widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Commercial App',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: MaterialColor(0xFF5d5fef, color),
          primaryColor: const Color.fromARGB(255, 93, 95, 239),
          primaryColorLight: Color.fromARGB(255, 165, 166, 246),
          unselectedWidgetColor: Colors.grey,
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: MaterialColor(0xFF5d5fef, color),
            primaryColor: const Color.fromARGB(255, 93, 95, 239),
            primaryColorLight: Color.fromARGB(255, 165, 166, 246),
            unselectedWidgetColor: Colors.grey,
            focusColor: Colors.red),
        home: const LoginScreen(),
      ),
    );
  }
}
