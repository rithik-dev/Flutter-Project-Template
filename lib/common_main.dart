import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_template/controllers/locale_controller.dart';
import 'package:project_template/controllers/theme_controller.dart';
import 'package:project_template/l10n/l10n.dart';
import 'package:project_template/screens/splash_screen.dart';
import 'package:project_template/services/local_storage.dart';
import 'package:project_template/theme/app_theme.dart';
import 'package:project_template/utils/app_config.dart';
import 'package:project_template/utils/globals.dart';
import 'package:project_template/utils/logger.dart';
import 'package:project_template/utils/route_generator.dart';
import 'package:project_template/widgets/flutter_error_widget.dart';
import 'package:provider/provider.dart';

Future<void> commonMain(AppConfig configuredApp) async {
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

  // run the configured app
  runApp(configuredApp);
}

class MainApp extends StatelessWidget {
  const MainApp({
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
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          log(id: 'localeResolutionCallback', msg: deviceLocale);
          if (deviceLocale == null) return null;

          late Locale locale;

          if (L10n.isSupported(deviceLocale)) {
            log(msg: 'sup');
            locale = deviceLocale;
          } else {
            locale = L10n.fallbackLocale;
          }

          LocaleController.of(context, listen: false).setLocale(
            locale,
            updateLocalStorage: false,
            setOnlyIfNotUpdatedManually: true,
            notify: false,
          );

          return locale;
        },
        // localeResolutionCallback: (deviceLocale, _) {
        //   if (deviceLocale != null) {
        //     log(id: 'localeResolutionCallback', msg: deviceLocale);
        //     WidgetsBinding.instance?.addPostFrameCallback((_) {
        //       LocaleController.of(context, listen: false).setLocale(
        //         deviceLocale,
        //         updateLocalStorage: false,
        //         setOnlyIfNotUpdatedManually: true,
        //       );
        //     });
        //   }
        //   return deviceLocale;
        // },
        themeMode: ThemeController.of(context).themeMode,
        locale: LocaleController.of(context).locale,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.localizationsDelegates,
        navigatorKey: Globals.navigatorKey,
        scaffoldMessengerKey: Globals.scaffoldMessengerKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }

 static Widget _appBuilder(BuildContext context, Widget? child) {
    final appBarOverlayStyle = Theme.of(context).appBarTheme.systemOverlayStyle;
    if (appBarOverlayStyle != null) {
      SystemChrome.setSystemUIOverlayStyle(appBarOverlayStyle);
    }

    return child!;
  }
}
