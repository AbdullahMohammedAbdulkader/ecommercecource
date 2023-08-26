import 'package:ecommercecource/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRout.login: (context) => const Login()
};