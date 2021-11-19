// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:kanban_flutter_app/controller/main_controller.dart';
import 'package:kanban_flutter_app/page/kanban_page.dart';
import 'package:kanban_flutter_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainController isController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xaltius Board',
      home: SafeArea(
        child: KanbanPage(),
      ),
      getPages: PageRoutes.pages,
      builder: EasyLoading.init(),
    );
  }
}
