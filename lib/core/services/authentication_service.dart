import 'dart:async';

import 'package:flutter_provider_login_sample/core/models/user.dart';
import 'package:flutter_provider_login_sample/core/services/api.dart';
import 'package:flutter_provider_login_sample/locator.dart';

class AuthenticationService{
  Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();
  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    var hadUser =fetchedUser !=null;
    if(hadUser!=null)
      {
        userController.add(fetchedUser);
      }
    return hadUser;
  }
}