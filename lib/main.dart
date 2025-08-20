import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/config/bootstrapper.dart';
import 'package:pinapp/src/config/routes/app_routes.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/core/theme/pinapp_theme.dart';

import 'src/core/app_constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Bootstrapper.initBlocs(),
      child: MaterialApp(
        title: StringConstants.pinAppName,
        debugShowCheckedModeBanner: false,
        theme: PinappTheme.light(),
        initialRoute: RouteConstants.posts,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
