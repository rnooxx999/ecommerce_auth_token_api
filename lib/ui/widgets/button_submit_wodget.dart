

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSubmitWidget extends StatelessWidget{
  VoidCallback? onPressed;
  String? text;
   ButtonSubmitWidget({ this.onPressed , this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
          padding: EdgeInsets.symmetric(vertical:14),
          backgroundColor: Theme.of(context).cardColor
      ),
        onPressed: onPressed,
        child: Text(text! , style: Theme.of(context).textTheme.headline1,));
  }
}
