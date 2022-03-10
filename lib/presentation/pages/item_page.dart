import 'package:clevrpos/presentation/pages/item_form_page.dart';
import 'package:clevrpos/presentation/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return itemListView(context);
  }

  Widget itemListView(BuildContext context) {
    return ListView.separated(
      itemCount: itemList.length,
      separatorBuilder: (context, index) => Divider(
        height: 0,
      ),
      itemBuilder: (context, index) {
        var item = itemList[index];
        return ItemListTile(
          image: item['image'],
          title: item['title'],
          description: item['description'],
          sellPrice: item['sellPrice'],
          onTap: () {
            Navigator.pushNamed(
              context,
              ItemFormPage.routeName,
              arguments: item,
            );
          },
        );
      },
    );
  }

  /// Data
  List<Map<String, dynamic>> get itemList {
    return [
      {
        'image':
            'https://cdn.eraspace.com/pub/media/catalog/product/cache/184775a204380039ae47e1177f9cfc1b/i/p/iphone_12_pro_pacific_blue_1_3.jpg',
        'title': 'iPhone 12 Pro',
        'description': '',
        'sellPrice': 1579900,
      },
      {
        'image':
            'https://cdn.eraspace.com/pub/media/catalog/product/cache/184775a204380039ae47e1177f9cfc1b/i/p/iphone_12_pro_pacific_blue_1_3.jpg',
        'title': 'iPhone 12 Pro',
        'description': '',
        'sellPrice': 1579900,
      },
      {
        'image':
            'https://cdn.eraspace.com/pub/media/catalog/product/cache/184775a204380039ae47e1177f9cfc1b/i/p/iphone_12_pro_pacific_blue_1_3.jpg',
        'title': 'iPhone 12 Pro',
        'description': '',
        'sellPrice': 1579900,
      },
      {
        'image':
            'https://cdn.eraspace.com/pub/media/catalog/product/cache/184775a204380039ae47e1177f9cfc1b/i/p/iphone_12_pro_pacific_blue_1_3.jpg',
        'title': 'iPhone 12 Pro',
        'description': '',
        'sellPrice': 1579900,
      },
      {
        'image':
            'https://cdn.eraspace.com/pub/media/catalog/product/cache/184775a204380039ae47e1177f9cfc1b/i/p/iphone_12_pro_pacific_blue_1_3.jpg',
        'title': 'iPhone 12 Pro',
        'description': '',
        'sellPrice': 1579900,
      }
    ];
  }
}
