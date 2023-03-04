import 'package:flutter/material.dart';

//https://googleflutter.com/flutter-add-item-to-listview-dynamically/
void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => HomeState();
}

class HomeState extends State<MyApp> {
  final List<String> path = <String>[
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
  ];
  final List<String> base64 = <String>[
    "2",
    "2",
  ];

  void addItemToList() {
    setState(() {
      var value = "path";
      path.insert(0, value);
      base64.insert(0, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial - googleflutter.com'),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              addItemToList();
            },
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: path.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(path[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
