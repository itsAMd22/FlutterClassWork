import 'package:flutter/material.dart';
import 'package:project_4/ConverterPage.dart';
import 'package:project_4/ListViewPage.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyApp> createState() => _CoverterPage();
}

class _CoverterPage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}