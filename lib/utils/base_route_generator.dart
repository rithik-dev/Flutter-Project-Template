// import 'package:coinmint_mobile_app/features/forgot_password/forgot_password.dart';
// import 'package:coinmint_mobile_app/features/login/login.dart';
// import 'package:coinmint_mobile_app/features/page_handler/page_handler.dart';
// import 'package:coinmint_mobile_app/features/splash/splash.dart';
// import 'package:coinmint_mobile_app/utils/logger.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// typedef RouteFn = Route<dynamic> Function(dynamic args);
//
// MaterialPageRoute _buildRoute(Widget widget) =>
//     MaterialPageRoute(builder: (_) => widget);
//
// abstract class BaseRouteGenerator {
//   const BaseRouteGenerator();
//
//   Map<String, RouteFn> getRoutes();
//
//   MaterialPageRoute buildRoute(Widget widget) => _buildRoute(widget);
// }
//
// class _RouteGenerator extends BaseRouteGenerator {
//   @override
//   Map<String, RouteFn> getRoutes() => {
//         SplashScreen.id: (args) => buildRoute(const SplashScreen()),
//         PageHandler.id: (_) => buildRoute(const PageHandler()),
//       };
// }
//
// class AppRouteGenerator {
//   static final AppRouteGenerator _instance = AppRouteGenerator._internal();
//
//   AppRouteGenerator._internal() {
//     _updateRoutes();
//   }
//
//   void _updateRoutes() {
//     _routes.clear();
//
//     for (final routeGenerator in _generators) {
//       final routesMap = routeGenerator.getRoutes();
//       _routes.addAll(routesMap);
//     }
//
//     print(_routes);
//   }
//
//   static const initialRoute = SplashScreen.id;
//
//   static final _generators = <BaseRouteGenerator>[
//     _RouteGenerator(),
//     ForgotPasswordRouteGenerator(),
//   ];
//
//   static final _routes = <String, RouteFn>{};
//
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
//       _instance._onGenerateRoute(settings);
//
//   Route<dynamic> _onGenerateRoute(RouteSettings settings) {
//     if (kDebugMode) {
//       _instance._updateRoutes();
//     }
//
//     final widget = _routes[settings.name];
//     if (widget != null) {
//       final args = settings.arguments as dynamic;
//
//       log<AppRouteGenerator>(msg: "Pushed ${settings.name}(${args ?? ''})");
//       return widget.call(args);
//     }
//
//     return _errorRoute(settings.name);
//   }
//
//   Route<dynamic> _errorRoute(String? name) {
//     return _buildRoute(
//       Scaffold(
//         body: Center(
//           child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
//         ),
//       ),
//     );
//   }
// }
//
// class ForgotPasswordRouteGenerator extends BaseRouteGenerator {
//   @override
//   Map<String, RouteFn> getRoutes() {
//     return {
//       LoginScreen.id: (_) => buildRoute(const LoginScreen()),
//       ForgotPasswordScreen.id: (_) => buildRoute(ForgotPasswordScreen()),
//     };
//   }
// }
