import 'package:flutter/material.dart';

import 'Models/globalitems.dart';
import 'Models/item.dart';
import 'Views/EditItemPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 167, 167, 167)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bayarsaikhan Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: GlobalItems().items.length,
          itemBuilder: (context, index) {
            final item = GlobalItems().items[index];
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(item.Name),
                  subtitle: Text(item.Description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditItemPage(item: item),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      GlobalItems().items.remove(item);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
