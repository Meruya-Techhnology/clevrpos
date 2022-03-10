import 'package:clevrpos/common/util/route_util.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final routeUtil = RouteUtil(context: context);

    ///

    return MaterialApp(
      title: 'Clevrpos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routeUtil.routes,
      initialRoute: routeUtil.initialRoute,
    );
  }
}
