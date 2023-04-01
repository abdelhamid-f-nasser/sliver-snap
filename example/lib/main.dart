import 'dart:io';

import 'package:example/app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

void main()async {
  runApp(const MyApp());
  if(Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
}
