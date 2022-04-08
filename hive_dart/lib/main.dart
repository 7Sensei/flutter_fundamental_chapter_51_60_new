import 'package:flutter/material.dart';
import 'package:hive_dart/model/monster.dart';
import 'package:hive_dart/view/main_page.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pathDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(pathDocumentDirectory.path);
  Hive.registerAdapter(
    MonsterAdapter(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
