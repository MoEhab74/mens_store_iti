import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/routing/route_generator.dart';
import 'package:mens_store/core/themes/theme_data.dart';
import 'package:mens_store/core/utils/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Mens Store',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          routerConfig: RouteGenerator.mainRoutingInOurApp,
        );
      },
    );
  }
}