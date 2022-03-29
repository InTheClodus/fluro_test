
import 'package:fluro/fluro.dart';
import 'package:fluro_test/page_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static final router = FluroRouter();
  static setupRoutes(){
    pageRoutes.forEach((path, handler) {
      router.notFoundHandler = Handler(
          handlerFunc: (BuildContext? context, Map<String, List<String>>? params) {
            return const Scaffold(
              body: Center(
                child: Text("noData"),
              ),
            );
          });
      router.define(path.toString(), handler: handler.getHandler(),transitionType: TransitionType.inFromRight);
    });
  }
}