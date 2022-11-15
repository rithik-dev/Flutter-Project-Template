// flutter build apk --flavor test -t lib/main_test.dart

import 'package:project_template/common_main.dart';
import 'package:project_template/utils/app_config.dart';

Future<void> main() async {
  const configuredApp = AppConfig(
    env: Environment.test,
  );

  await commonMain(configuredApp);
}
