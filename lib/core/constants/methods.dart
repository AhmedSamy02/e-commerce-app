import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_ecommerce/core/constants/values.dart';

void initializeLocators() {
  getit.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
}
