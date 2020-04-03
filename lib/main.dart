import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';
import 'screens/getstarted.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => User(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFF7D59),
        ),
        home: GetStarted(),
      ),
    );
  }
}
