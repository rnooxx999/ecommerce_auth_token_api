

import 'package:flutter/cupertino.dart';
import 'package:shop_route/base/base_navigators.dart';

//الn اشارة الى التامبلت باراميتير ونعطيه شرط انه اي كلاس يستخدمه عليه ان يستمد من الnavigator ز
class BaseViewModel <N extends BaseNavigator> extends ChangeNotifier{

  N? navigator;

}