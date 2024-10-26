import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DataTable Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataTableExample(),
    );
  }
}

class DataTableExample extends StatelessWidget {
  final List<User> users = [
    User(name: 'John Doe', age: 28, email: 'john.doe@example.com'),
    User(name: 'Jane Smith', age: 24, email: 'jane.smith@example.com'),
    User(name: 'Robert Brown', age: 30, email: 'robert.brown@example.com'),
    User(name: 'Lucy White', age: 27, email: 'lucy.white@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Example'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: users
              .map(
                (user) => DataRow(
                  cells: [
                    DataCell(Text(user.name)),
                    DataCell(Text(user.age.toString())),
                    DataCell(Text(user.email)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  final String email;

  User({required this.name, required this.age, required this.email});
}
