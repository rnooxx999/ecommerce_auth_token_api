

import 'package:flutter/widgets.dart';
import 'package:shop_route/base/base_state.dart';
import 'package:shop_route/ui/home/home_v_m.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen , HomeViewModel>
implements HomeNavigator{

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
