import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinterest_clone/screens/screens.dart';

void main() {
  runApp(const Pinterest());
}

class Pinterest extends StatelessWidget {
  const Pinterest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Pinterest Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const IndexScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
