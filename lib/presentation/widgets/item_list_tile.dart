import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  final String image;
  final String title;
  final String? description;
  final int sellPrice;
  final VoidCallback? onTap;

  const ItemListTile({
    required this.image,
    required this.title,
    this.description,
    this.sellPrice = 0,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: 60,
              width: 60,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Rp. $sellPrice',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
