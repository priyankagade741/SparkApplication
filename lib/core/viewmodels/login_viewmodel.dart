import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_login_sample/core/services/authentication_service.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/base_viewmodel.dart';
import 'package:flutter_provider_login_sample/core/enums/viewState.dart';

import '../../locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = locator<
      AuthenticationService>();
  String errorMessage;

  //Business Logic
  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    //not a number
    if(userId==null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}