import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  final String? image;
  final String title;
  final String? description;
  final int sellPrice;
  final VoidCallback? onTap;
  final VoidCallback? onDeleteTap;

  const ItemListTile({
    this.image,
    required this.title,
    this.description,
    this.sellPrice = 0,
    this.onTap,
    this.onDeleteTap,
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
            (image != null)
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: Image.network(
                      image!,
                      height: 60,
                      width: 60,
                    ),
                  )
                : SizedBox.shrink(),
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
            IconButton(
              onPressed: onDeleteTap,
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
