// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kanban_flutter_app/route_names.dart';
import 'package:get/get.dart';

class PageRoutes {
  static final pages = [
    GetPage(name: RouteNames.task, page: () => Container()),
  ];
}
