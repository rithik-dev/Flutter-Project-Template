import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:project_template/controllers/locale_controller.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/screens/splash_screen.dart';
import 'package:project_template/utils/app_theme.dart';
import 'package:project_template/utils/route_generator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(_MainApp());
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(_, child, ___) => child;
}

class _MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleController(),
      builder: (context, _) {
        final _localeCon = LocaleController.of(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: _ScrollBehavior(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          locale: _localeCon.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: L10n.localizationsDelegates,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: SplashScreen.id,
        );
      },
    );
  }
}
