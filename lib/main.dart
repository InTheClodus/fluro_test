import 'package:fluro_test/page_router.dart';
import 'package:fluro_test/page_routes.dart';
import 'package:flutter/material.dart';

void main() {
  PageRouter.setupRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: PageRouter.router.generator,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
