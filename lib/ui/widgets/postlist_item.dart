import 'package:flutter/material.dart';
import 'package:flutter_provider_login_sample/core/models/post.dart';
import 'package:flutter_provider_login_sample/ui/shared/app_colors.dart';
import 'package:flutter_provider_login_sample/ui/shared/text_styles.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  const PostListItem({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Colors.black12)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(post.title, style: boldTxtStyle),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis,style:normalTxtStyle)
          ],
        ),
      ),
    );
  }
}
