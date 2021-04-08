import 'package:flutter_provider_login_sample/core/services/api.dart';
import 'package:flutter_provider_login_sample/core/services/authentication_service.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/comments_viewmodel.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'core/viewmodels/login_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => CommentsViewModel());
}