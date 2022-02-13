import 'package:breakingbadbloc/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( BreakinBadApp(appRouter: AppRouter(),));
}

class BreakinBadApp extends StatelessWidget {
final  AppRouter appRouter;

  const BreakinBadApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateroute,
    );
  }
}