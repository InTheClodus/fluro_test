
import 'package:fluro/fluro.dart';
import 'package:fluro_test/page_routes.dart';

class PageRouter {
  static final router = FluroRouter();
  static setupRoutes(){
    pageRoutes.forEach((path, handler) {
      router.define(path.toString(), handler: handler.getHandler(),transitionType: TransitionType.inFromRight);
    });
  }
}