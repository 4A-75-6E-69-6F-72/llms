import 'package:flutter/material.dart';
import 'package:llms/controllers/base_controller.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/sql_manager.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    createDatabaseIfNotExist();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: Config.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const BaseController(),
    );
  }

  void createDatabaseIfNotExist() {
    try {
      SqlManager.createDatabase();
    } catch (e) {
      print(e);
    }
  }
}
