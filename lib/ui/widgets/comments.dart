import 'package:flutter/material.dart';
import 'package:flutter_provider_login_sample/core/enums/viewState.dart';
import 'package:flutter_provider_login_sample/core/models/comment.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/comments_viewmodel.dart';
import 'package:flutter_provider_login_sample/ui/shared/app_colors.dart';
import 'package:flutter_provider_login_sample/ui/shared/text_styles.dart';
import 'package:flutter_provider_login_sample/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_login_sample/ui/views/base_view.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsViewModel>(
      onModelReady:(model)=>model.fetchComments(postId),
        builder: (context,model,child)=>model.state==ViewState.Busy
      ?Center(child: CircularProgressIndicator())
      :Expanded(child:ListView(
        children: model.comments.map((comment)=>CommentItem(comment)).toList(),
      ),
      )
      ,
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: boxColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: boldTxtStyle,
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body,
            style: normalTxtStyle),
        ],
      ),
    );
  }
}
