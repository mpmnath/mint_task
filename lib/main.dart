import 'package:mint/app/app.dart';
import 'package:mint/bootstrap.dart';

import 'core/app_core.dart';

void main() {
  bootstrap(() => App(), environment: Environment.development);
}
