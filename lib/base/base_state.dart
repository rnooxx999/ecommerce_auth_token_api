


import 'package:flutter/material.dart';
import 'package:shop_route/base/base_navigators.dart';
import 'package:shop_route/base/base_v_m.dart';

import '../ui/widgets/dialog_util.dart';
//يقوم بترتيب الكلاس ويعمل parent كلاس مشترك لل navigator و دهثصوخيثم بدلا من تكرار كود الدايلوج في كل مكان



abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {

  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  VM initViewModel();

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator= null;
  }

  @override
  void hideDialog() {
    DialogUtil.hideLoading(context);
  }

  @override
  void showMessage({ required String message, String? posActionTitle, VoidCallback? posAction, String? negActionTitle, VoidCallback? negAction, bool isDismissible = true}) {

    DialogUtil.showMessage(context: context, message: message,
        posActionTitle: 'ok' , posAction: posAction
        ,isDismissible: isDismissible);

  }

  @override
  void showProgressDialog(String progressMessage) {
    DialogUtil.showProgressDialog(context, progressMessage);

  }

}