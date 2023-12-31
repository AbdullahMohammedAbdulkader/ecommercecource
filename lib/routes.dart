import 'package:ecommercecource/core/middleware/mymiddleware.dart';
import 'package:ecommercecource/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecource/view/screen/auth/login.dart';
import 'package:ecommercecource/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecource/view/screen/auth/signup.dart';
import 'package:ecommercecource/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecource/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecource/view/screen/auth/success_signup.dart';
import 'package:ecommercecource/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecource/view/screen/cart.dart';
import 'package:ecommercecource/view/screen/homescreen.dart';
import 'package:ecommercecource/view/screen/items.dart';
import 'package:ecommercecource/view/screen/language.dart';
import 'package:ecommercecource/view/screen/myfavorite.dart';
import 'package:ecommercecource/view/screen/onboarding.dart';
import 'package:ecommercecource/view/screen/productdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () =>  const Cart()),
  GetPage(name: AppRout.login, page: () => const Login()),
  GetPage(name: AppRout.SignUp, page: () => const SignUp()),
  GetPage(name: AppRout.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRout.verifCcode, page: () => const VerifyCode()),
  GetPage(name: AppRout.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRout.SuccessSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRout.SuccessResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRout.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),

  //onBoarding
  GetPage(name: AppRout.onBoarding, page: () => const OnBoarding()),

  //home
  GetPage(name: AppRout.homepage, page: () => const HomeScreen()),

  //Items
  GetPage(name: AppRout.items, page: () => const Items()) ,
  GetPage(name: AppRout.productdetails, page: () => const ProductDetails()) ,

  //favorite

  GetPage(name: AppRout.myfavorite, page: () => const MyFavorite()),


];
