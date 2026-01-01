import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  late Box _box;

  Future<StorageService> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('app_storage');
    return this;
  }

  bool get isOnboardingComplete => _box.get('onboarding_complete', defaultValue: false);

  Future<void> setOnboardingComplete(bool value) async {
    await _box.put('onboarding_complete', value);
  }
}
