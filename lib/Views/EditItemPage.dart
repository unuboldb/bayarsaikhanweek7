import 'package:flutter/material.dart';

import '../Models/globalitems.dart';
import '../Models/item.dart';

class EditItemPage extends StatefulWidget {
  final Item item;
  const EditItemPage({Key? key, required this.item}) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState(item);
}

class _EditItemPageState extends State<EditItemPage> {
  _EditItemPageState(item);

  late Item item = widget.item;

  TextEditingController itemNameController = new TextEditingController();
  TextEditingController itemDescriptionController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    itemNameController.text = item.Name;
    itemDescriptionController.text = item.Description;
  }

  void _updateItemPressed() {
    var items = GlobalItems().items;
    Item currentItem =
        GlobalItems().items.firstWhere((index) => index.Id == item.Id);

    if (currentItem.Name != itemNameController ||
        currentItem.Description != itemDescriptionController) {
      currentItem.Name = itemNameController.text;
      currentItem.Description = itemDescriptionController.text;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Edit Item Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: itemNameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: itemDescriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              ElevatedButton(
                onPressed: _updateItemPressed,
                child: Text("Update Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
