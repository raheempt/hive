import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive2/Home_Screen.dart';
import 'package:hive2/Todu.dart';
import 'package:path_provider/path_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory =await getApplicationDocumentsDirectory(); 
  Hive.init(directory.path);
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('Todo');
  await Hive.openBox('person');
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}