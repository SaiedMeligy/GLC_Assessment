import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glc_assessment/Features/home/logic/home_cubit.dart';
import '../../Features/home/ui/screens/home_screen.dart';
import '../di/di.dart';
import 'page_route_name.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.homeScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (_) => getIt<HomeCubit>()..loadInitial(),
            child: const HomeScreen(),
          );
        });


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}
