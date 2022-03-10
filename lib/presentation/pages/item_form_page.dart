import 'package:clevrpos/presentation/widgets/image_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({Key? key}) : super(key: key);
  static const String routeName = '/item-form';

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final imagePicker = ImagePicker();
  XFile? itemImage;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      retrieveArguments(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Item'),
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
                decoration: InputDecoration(
                  labelText: 'Nama item',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Harga',
                ),
              ),
              SizedBox(height: 16),
              MaterialButton(
                child: Text('Tambah'),
                minWidth: double.maxFinite,
                textColor: Theme.of(context).colorScheme.onPrimary,
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> retrieveArguments(BuildContext context) async {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is Map<String, dynamic>) {
      print(arguments);
    }
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
