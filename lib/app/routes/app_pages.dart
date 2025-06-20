import 'package:get/get.dart';

import '../modules/analytic/bindings/analytic_binding.dart';
import '../modules/analytic/views/analytic_view.dart';
import '../modules/barcode_generator/bindings/barcode_generator_binding.dart';
import '../modules/barcode_generator/views/barcode_generator_view.dart';
import '../modules/carts/bindings/carts_binding.dart';
import '../modules/carts/views/carts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product_add/bindings/product_add_binding.dart';
import '../modules/product_add/views/product_add_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/product_edit/bindings/product_edit_binding.dart';
import '../modules/product_edit/views/product_edit_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.ANALYTIC,
      page: () => const AnalyticView(),
      binding: AnalyticBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD,
      page: () => const ProductAddView(),
      binding: ProductAddBinding(),
    ),
    GetPage(
      name: _Paths.CARTS,
      page: () => const CartsView(),
      binding: CartsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_EDIT,
      page: () => const ProductEditView(),
      binding: ProductEditBinding(),
    ),
    GetPage(
      name: _Paths.BARCODE_GENERATOR,
      page: () => const BarcodeGeneratorView(),
      binding: BarcodeGeneratorBinding(),
    ),
  ];
}
