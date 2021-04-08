import 'package:flutter/material.dart';
import 'package:flutter_provider_login_sample/core/enums/viewState.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/login_viewmodel.dart';
import 'package:flutter_provider_login_sample/locator.dart';
import 'package:flutter_provider_login_sample/ui/shared/app_colors.dart';
import 'package:flutter_provider_login_sample/ui/views/base_view.dart';
import 'package:flutter_provider_login_sample/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';



class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(

      builder: (context, model, child) =>
          Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              children: <Widget>[
                LoginHeader(
                    validationMessage: model.errorMessage,
                    controller: _controller
                ),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                  color: Colors.black26,

                  child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black)
                  ),
                  onPressed: () async {
                    var loginSuccess = await model.login(_controller.text);
                    if (loginSuccess) {
                      Navigator.pushNamed(context, '/');
                    }
                  },

                )

              ],
            ),
          ),

    );
  }
}
