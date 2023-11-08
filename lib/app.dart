import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seequl/core/seequl/theme.dart';
import 'package:seequl/features/dashboard/app/pages/dashboard_page.dart';

class SeeQulApp extends StatelessWidget {
  const SeeQulApp({super.key});

  static final navKey = GlobalKey<NavigatorState>();
  static final scaffoledMessagingKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (context, _) {
          return MaterialApp(
            title: 'Seequl',
            navigatorKey: navKey,
            scaffoldMessengerKey: scaffoledMessagingKey,
            theme: themeData,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            home: const DashboardPage(),
          );
        });
  }
}
