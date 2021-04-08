import 'package:flutter/material.dart';
import 'package:flutter_provider_login_sample/core/viewmodels/base_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget{
final Widget Function(BuildContext context,T model,Widget child) builder ;
final Function(T) onModelReady;

BaseView({this.builder,this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
T model =locator<T>();
  @override
  void initState() {
    // TODO: implement initState
    if(widget.onModelReady != null) {
      widget.onModelReady(model);
    }

  }
@override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider<T>(
      create: (context) => model,
  child: Consumer<T>(builder: widget.builder));
  }
}