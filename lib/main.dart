import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glc_assessment/core/routing/app_router.dart';
import 'package:glc_assessment/core/routing/page_route_name.dart';
import 'core/di/di.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(377, 838),
      minTextAdapt: true,

      child: MaterialApp(
        title: 'Glc',
        debugShowCheckedModeBanner: false,
        initialRoute: PageRouteName.homeScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}

