import 'package:get/get.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/home/home_view.dart';
import '../views/streak/streak_view.dart';
import '../views/video/video_view.dart';
import '../view_models/bindings/home_binding.dart';
import '../view_models/bindings/onboarding_binding.dart';
import '../view_models/bindings/streak_binding.dart';
import '../view_models/bindings/video_binding.dart';
import '../views/main/main_view.dart';
import '../view_models/bindings/main_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
  name: _Paths.MAIN,
  page: () => const MainView(),
  binding: MainBinding(),
),

    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.STREAK,
      page: () => const StreakView(),
      binding: StreakBinding(),
    ),
  ];
}
