import 'package:flutter/material.dart';

class AddSalesPage extends StatefulWidget {
  const AddSalesPage({Key? key}) : super(key: key);
  static const String routeName = '/add-sales';

  @override
  State<AddSalesPage> createState() => _AddSalesPageState();
}

class _AddSalesPageState extends State<AddSalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Penjualan'),
      ),
      body: Center(
        child: Text('Ini halaman sales'),
      ),
    );
  }
}
