// flutter build apk --flavor development -t lib/main_development.dart

import 'package:project_template/common_main.dart';
import 'package:project_template/utils/app_config.dart';

Future<void> main() async {
  const configuredApp = AppConfig(
    env: Environment.development,
  );

  await commonMain(configuredApp);
}
