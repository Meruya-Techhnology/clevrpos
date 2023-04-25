import 'package:clevrpos/common/util/database_util.dart';
import 'package:clevrpos/infrastructure/datasources/item_datasource.dart';
import 'package:clevrpos/infrastructure/models/item_model.dart';
import 'package:clevrpos/presentation/widgets/image_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({Key? key}) : super(key: key);
  static const String routeName = '/item-form';

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final imagePicker = ImagePicker();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  XFile? itemImage;
  Future<Database>? database;
  ItemDatasource? itemDatasource;
  ItemModel? itemModel;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await retrieveArguments(context);
      await initializeDependency();
    });
  }

  int get price {
    final stringPrice = priceController.text;
    final result = int.tryParse(stringPrice);
    return result ?? 0;
  }

  int get quantity {
    final stringQuantity = quantityController.text;
    final result = int.tryParse(stringQuantity);
    return result ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (itemModel != null) ? 'Update Item' : 'Tambah Item',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagePickerButton(
                imagePath: itemImage?.path,
                onTap: () {
                  pickImage(context);
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama item',
                ),
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: 'Harga',
                ),
              ),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
              ),
              SizedBox(height: 16),
              MaterialButton(
                child: Text((itemModel != null) ? 'Update' : 'Tambah'),
                minWidth: double.maxFinite,
                textColor: Theme.of(context).colorScheme.onPrimary,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  /// Logic, item model != null update item, item model == null
                  /// create new item
                  if (itemModel != null) {
                    updateItem(context);
                  } else {
                    createItem(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initializeDependency() async {
    database = DatabaseUtil.initialize();
    itemDatasource = ItemDatasource(
      database: await database!,
    );
  }

  Future<void> retrieveArguments(BuildContext context) async {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is ItemModel) {
      nameController.text = arguments.name;
      priceController.text = arguments.price.toString();
      quantityController.text = arguments.quantity.toString();
      itemModel = arguments;
      setState(() {});
    }
  }

  Future<void> createItem(BuildContext context) async {
    final request = ItemModel(
      name: nameController.text,
      price: price,
      quantity: quantity,
    );
    itemDatasource?.create(request).then((result) {
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item created successfully'),
          ),
        );
      }
    }, onError: (error) {
      debugPrint('ERROR : ${error.toString()}');
    });
  }

  Future<void> updateItem(BuildContext context) async {
    final request = ItemModel(
      id: itemModel?.id,
      name: nameController.text,
      price: price,
      quantity: quantity,
    );
    itemDatasource?.update(request).then((result) {
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item updated successfully'),
          ),
        );
        Navigator.pop(
          context,
          true,
        );
      }
    }, onError: (error) {
      debugPrint('ERROR : ${error.toString()}');
    });
  }

  Future<void> pickImage(BuildContext context) async {
    var pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      itemImage = pickedImage;
      setState(() {});
    }
  }
}
