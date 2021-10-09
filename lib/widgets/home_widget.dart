import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String text;
  const HomeWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Manipulasi widget'),
          Text(text),
        ],
      ),
    );
  }
}
