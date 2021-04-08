import 'package:flutter_provider_login_sample/core/enums/viewState.dart';
import 'package:flutter_provider_login_sample/core/models/post.dart';
import 'package:flutter_provider_login_sample/core/services/api.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/base_viewmodel.dart';

import '../../locator.dart';

class HomeViewModel extends BaseViewModel{
Api _api = locator<Api>();
List<Post> posts;

Future getPosts(int userId) async{
  setState(ViewState.Busy);
  posts=await _api.getPostsForUser(userId);
  setState(ViewState.Idle);
}
}