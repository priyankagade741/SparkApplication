import 'package:flutter/widgets.dart';
import 'package:flutter_provider_login_sample/core/enums/viewState.dart';
import 'package:flutter_provider_login_sample/core/services/authentication_service.dart';

import '../../locator.dart';

class BaseViewModel extends ChangeNotifier{
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

//stateManagement
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

//stateManagement end
}