import 'package:clevrpos/presentation/pages/item_form_page.dart';
import 'package:clevrpos/presentation/pages/add_sales_page.dart';
import 'package:clevrpos/presentation/pages/dashboard_page.dart';
import 'package:clevrpos/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class RouteUtil {
  final BuildContext context;
  RouteUtil({
    required this.context,
  });

  Map<String, Widget Function(BuildContext)> routes = {
    LoginPage.routeName: (context) => const LoginPage(),
    DashboardPage.routeName: (context) => const DashboardPage(),
    ItemFormPage.routeName: (context) => const ItemFormPage(),
    AddSalesPage.routeName: (context) => const AddSalesPage(),
  };

  String get initialRoute {
    /// Add some logic for initial route
    return LoginPage.routeName;
  }
}
