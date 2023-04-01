import 'package:example/app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

void main()async {
  runApp(const MyApp());
  await FlutterDisplayMode.setHighRefreshRate();
}
