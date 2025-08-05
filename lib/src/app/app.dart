import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/src/app/router.dart';
import 'package:test_app/src/app/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        extensions: const [AppThemeColors.light],
        fontFamily: 'SFProText',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: const [AppThemeColors.dark],
        fontFamily: 'SFProText',
      ),
      builder: (context, child) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return child!;
          },
        );
      },
      routerConfig: RouterConf.goRouter,
    );
  }
}
