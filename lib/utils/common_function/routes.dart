import 'package:zero_scarp/allpackages.dart';

class Routes {
  static final routes = [
    // GetPage(name: '/', page: () => SplashScreen()),

    GetPage(name: '/login', page: () => const LoginScreen()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/otp', page: () => const OTPScreen()),
    GetPage(name: '/forgototp', page: () => ForgotOTPScreen()),
    GetPage(name: '/changeNewPassword', page: () => const ChangeNewPassword()),
    GetPage(name: '/detailsScreen', page: () => DetailsScreen()),
  ];
}
