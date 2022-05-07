import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_template/controllers/locale_controller.dart';
import 'package:project_template/controllers/theme_controller.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/screens/splash_screen.dart';
import 'package:project_template/services/local_storage.dart';
import 'package:project_template/utils/app_theme.dart';
import 'package:project_template/utils/globals.dart';
import 'package:project_template/utils/route_generator.dart';
import 'package:project_template/widgets/flutter_error_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // set custom error page
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return FlutterErrorWidget(errorDetails: errorDetails);
  };

  // initialize
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
    LocalStorage.initialize(),
  ]);

  // end
  FlutterNativeSplash.remove();
  runApp(const _MainApp());
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleController>(
          create: (_) => LocaleController(),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (_) => ThemeController(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: _appBuilder,
        scrollBehavior: const _DefaultScrollBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        localeResolutionCallback: (deviceLocale, _) {
          if (deviceLocale != null) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              LocaleController.of(context, listen: false).setLocale(
                deviceLocale,
                updateLocalStorage: false,
                setOnlyIfNotUpdatedManually: true,
              );
            });
          }
          return null;
        },
        themeMode: ThemeController.of(context).themeMode,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.localizationsDelegates,
        navigatorKey: Globals.navigatorKey,
        scaffoldMessengerKey: Globals.scaffoldMessengerKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }

  Widget _appBuilder(BuildContext context, Widget? child) {
    final appBarOverlayStyle = Theme.of(context).appBarTheme.systemOverlayStyle;
    if (appBarOverlayStyle != null) {
      SystemChrome.setSystemUIOverlayStyle(appBarOverlayStyle);
    }

    return child!;
  }
}

class _DefaultScrollBehavior extends ScrollBehavior {
  const _DefaultScrollBehavior({
    AndroidOverscrollIndicator? androidOverscrollIndicator,
  }) : super(androidOverscrollIndicator: androidOverscrollIndicator);

  @override
  Widget buildViewportChrome(_, child, __) => child;
}
