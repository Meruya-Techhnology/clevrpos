import 'package:clevrpos/common/core/dashboard_component.dart';
import 'package:clevrpos/presentation/pages/sales_page.dart';
import 'package:flutter/material.dart';

import 'item_form_page.dart';
import 'add_sales_page.dart';
import 'home_page.dart';
import 'item_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var pageController = PageController(
    initialPage: 0,
  );

  var currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Beranda'),
              onTap: () {
                changePage(0);
              },
            ),
            ListTile(
              title: Text('Item'),
              onTap: () {
                changePage(1);
              },
            ),
            ListTile(
              title: Text('Penjualan'),
              onTap: () {
                changePage(2);
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          dashboardComponent(context)[currentPageIndex].floatingActionButton,
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) =>
            dashboardComponent(context)[index].body,
      ),
    );
  }

  List<DashboardComponent> dashboardComponent(BuildContext context) {
    return [
      DashboardComponent(
        body: HomePage(),
      ),
      DashboardComponent(
        body: ItemPage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(
              context,
              ItemFormPage.routeName,
            );
          },
        ),
      ),
      DashboardComponent(
        body: SalesPage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddSalesPage.routeName,
            );
          },
        ),
      ),
    ];
  }

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    currentPageIndex = index;
    setState(() {});
  }
}
