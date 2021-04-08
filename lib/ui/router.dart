import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_login_sample/core/models/post.dart';
import 'package:flutter_provider_login_sample/ui/views/home_view.dart';
import 'package:flutter_provider_login_sample/ui/views/login_view.dart';
import 'package:flutter_provider_login_sample/ui/views/post_view.dart';

class Router_App {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/post':
        var post=settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post:post));
      default:
        return MaterialPageRoute(builder: (_) =>
            Scaffold(
                body: Center(
                    child: Text('No Route Defined for ${settings.name}'))
            )
        );
    }
  }
}
