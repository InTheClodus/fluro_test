import 'package:fluro/fluro.dart';
import 'package:fluro_test/bundle.dart';
import 'package:fluro_test/page_router.dart';
import 'package:flutter/material.dart';

typedef HandlerFunc = Widget Function(
    BuildContext? context, Map<String, List<dynamic>>? params);
typedef PageBuilderFunc = Widget Function(Bundle bundle);

class PageBuilder {
   PageBuilderFunc? builder;
   HandlerFunc? handlerFunc;

  PageBuilder({required builder}) {
    handlerFunc = (context, _) {
      return builder(ModalRoute.of(context!)?.settings.arguments as Bundle);
    };
  }

  Handler getHandler() {
    return Handler(handlerFunc: handlerFunc!);
  }
}

enum PageName { login_page, home_page, class_detail_page }

final Map<PageName, PageBuilder> pageRoutes = {
  PageName.login_page: PageBuilder(builder: (bundler) => const LoginPage()),
  PageName.home_page: PageBuilder(builder: (bundler) => HomePage(bundler)),
  PageName.class_detail_page:
      PageBuilder(builder: (bundler) => ClassDetailPage(bundler)),
};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登錄")),
      body: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, PageName.home_page.toString(),
            arguments: Bundle()..putInt("id", 12312)..putString("name", "v"));
      }),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage(this.bundle, {Key? key}) : super(key: key);
  final Bundle bundle;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首頁")),
      body: Column(
        children: [
          Text("${widget.bundle.getInt("id")}"),
          Text(widget.bundle.getString("name")),
          FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, PageName.class_detail_page.toString(),
                arguments: Bundle()..putInt("name", 12312));
          })
        ],
      ),
    );
  }
}

class ClassDetailPage extends StatefulWidget {
  const ClassDetailPage(this.bundle, {Key? key}) : super(key: key);
  final Bundle bundle;

  @override
  _ClassDetailPageState createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("詳情")),
      body: Column(
        children: [
          Text(widget.bundle.toString()),
        ],
      ),
    );
  }
}
