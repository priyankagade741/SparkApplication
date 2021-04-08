import 'package:flutter_provider_login_sample/core/enums/viewState.dart';
import 'package:flutter_provider_login_sample/core/models/comment.dart';
import 'package:flutter_provider_login_sample/core/services/api.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/base_viewmodel.dart';

import '../../locator.dart';

class CommentsViewModel extends BaseViewModel{
  Api _api = locator<Api>();
  List<Comment> comments ;
  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments =await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}