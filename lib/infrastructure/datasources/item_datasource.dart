import 'package:clevrpos/infrastructure/models/item_model.dart';
import 'package:sqflite/sqflite.dart';

class ItemDatasource {
  final Database database;

  ItemDatasource({
    required this.database,
  });

  Future<bool> delete(int id) async {
    final result = await database.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
    return (result != 0);
  }

  Future<bool> update(ItemModel model) async {
    final id = await database.update(
      'items',
      {
        'name': model.name,
        'price': model.price,
        'quantity': model.quantity,
      },
      where: 'id = ?',
      whereArgs: [model.id],
    );
    return (id != 0);
  }

  Future<bool> create(ItemModel model) async {
    final id = await database.insert(
      'items',
      model.toJson(),
    );
    return (id != 0);
  }

  Future<List<ItemModel>> select() async {
    final rows = await database.query(
      'items',
    );
    final result = List<ItemModel>.from(
      rows.map(
        (row) => ItemModel.fromJson(
          row,
        ),
      ),
    );
    return result;
  }
}
