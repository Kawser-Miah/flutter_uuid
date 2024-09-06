import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'main.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Coseries"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Enter Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  fillColor: Theme.of(context).colorScheme.inversePrimary,
                  filled: true),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                onPressed: () {
                  Utils.testList
                      .add(Item(title: titleController.text, id: Uuid().v4()));
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyHomePage(
                      title: 'Coseries',
                    );
                  }));
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

class Item {
  final String id;
  final String title;

  Item({required this.title, required this.id});
}

class Utils {
  static List<Item> testList = [
    Item(title: "Coseries", id: Uuid().v4()),
  ];
}
