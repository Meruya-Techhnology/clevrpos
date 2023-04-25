import 'package:clevrpos/infrastructure/models/item_model.dart';
import 'package:clevrpos/presentation/pages/item_form_page.dart';
import 'package:clevrpos/presentation/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/util/database_util.dart';
import '../../infrastructure/datasources/item_datasource.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  /// Data
  List<ItemModel> itemList = [];
  ItemDatasource? itemDatasource;
  Future<Database>? database;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await initializeDependency();
      await retrieveItems();
    });
  }

  Future<void> initializeDependency() async {
    database = DatabaseUtil.initialize();
    itemDatasource = ItemDatasource(
      database: await database!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: retrieveItems,
      child: itemListView(context),
    );
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
          title: item.name,
          sellPrice: item.price,
          onDeleteTap: () => deleteItem(
            item.id!,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              ItemFormPage.routeName,
              arguments: item,
            ).then((result) {
              if (result is bool && result) {
                retrieveItems();
              }
            });
          },
        );
      },
    );
  }

  Future<void> retrieveItems() async {
    debugPrint('Retrieve items');
    itemList = (await itemDatasource?.select())!;
    setState(() {});
  }

  Future<void> deleteItem(int id) async {
    itemDatasource?.delete(id).then(
      (result) {
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Item successfully deleted'),
            ),
          );
        }
      },
    );
  }
}
