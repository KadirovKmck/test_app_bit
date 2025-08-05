import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/src/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const App());
}
