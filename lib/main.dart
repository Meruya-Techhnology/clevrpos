import 'package:clevrpos/common/util/database_util.dart';
import 'package:clevrpos/common/util/route_util.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUtil.initialize();
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
