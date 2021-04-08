import 'package:flutter/material.dart';
import 'package:flutter_provider_login_sample/core/models/user.dart';
import 'package:flutter_provider_login_sample/core/services/authentication_service.dart';
import 'package:flutter_provider_login_sample/locator.dart';
import 'package:flutter_provider_login_sample/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) => locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            initialRoute: '/login',
        onGenerateRoute: Router_App.generateRoute,
          ),
    );
  }
}
