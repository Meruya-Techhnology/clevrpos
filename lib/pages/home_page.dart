import 'package:clevrpos/widgets/home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              print('Tombolnya di klik');
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: HomeWidget(
        text: 'Ini halaman home saya',
      ),
    );
  }
}
