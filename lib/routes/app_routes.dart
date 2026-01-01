part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const STREAK = _Paths.STREAK;
  static const VIDEO = _Paths.VIDEO;
  static const MAIN = _Paths.MAIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const STREAK = '/streak';
  static const VIDEO = '/video';
  static const MAIN = '/main';
}
