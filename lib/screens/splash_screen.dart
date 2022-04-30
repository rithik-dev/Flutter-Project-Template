import 'package:flutter/material.dart';
import 'package:project_template/screens/home_screen.dart';
import 'package:project_template/utils/app_assets.dart';
import 'package:project_template/widgets/custom_loader.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    (() async {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                  child: Image.asset(AppAssets.appIcon),
                ),
              ),
            ),
            const CustomLoader(),
            const Expanded(
              flex: 1,
              child: SizedBox.expand(),
            ),
          ],
        ),
      ),
    );
  }
}
