// flutter build apk --flavor production -t lib/main_production.dart

import 'package:project_template/common_main.dart';
import 'package:project_template/utils/app_config.dart';

Future<void> main() async {
  const configuredApp = AppConfig(
    env: Environment.production,
  );

  await commonMain(configuredApp);
}
