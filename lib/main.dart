import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/data/services/storage_service.dart';
import 'package:machine_test_2026/routes/app_pages.dart';
import 'data/services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          title: "Flutter Machine Test",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
        );
      }
    );
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
  Get.put(ApiService());
}
