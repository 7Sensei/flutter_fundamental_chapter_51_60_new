import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final int x = -5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extention'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              x.negate().toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bilangan' & x.negate().toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

extension IntergerExtention on int {
  int negate() => -1 * this;
}

extension SringExtention on String {
  String operator &(String other) => this + ' ' + other;
}

// extension ListExtention<T> on List<T> {
//   T get MidElement =>
//       (this.length == 0) ? Null : this[(this.length / 2).floor()];
// }
