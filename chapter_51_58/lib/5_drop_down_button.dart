import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Person selectedPerson;
  List<Person> person = [
    Person('Joni'),
    Person('Joko'),
  ];

  List<DropdownMenuItem> generateItems(List<Person> person) {
    List<DropdownMenuItem> items = [];
    for (var item in person) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Dropdown Button'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: DropdownButton(
              isExpanded: true,
              value: selectedPerson,
              items: generateItems(person),
              onChanged: (item) {
                setState(() {
                  selectedPerson = item;
                });
              },
            ),
          ),
          Text(
            (selectedPerson != null)
                ? selectedPerson.name
                : 'Belum ada yang terpilih',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Person {
  String name;

  Person(this.name);
}
