import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtil {
  static void showProgressDialog(BuildContext context, String message,
      {bool iaDissmissle = true}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(message)
              ],
            ),
          );
        });
  }
    static void hideLoading(BuildContext context) {
      Navigator.pop(context);

  }
  static void showMessage({required BuildContext context,
    required String message,
      String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        bool isDismissible = true}) {
    showDialog(
        context: context,
        builder: (context) {
          List<Widget> actions = [];
          if (posActionTitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (posAction != null) {
                    posAction();
                  }
                },
                child: Text(posActionTitle)));
          }
          if (negActionTitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (negAction != null) {
                    negAction();
                  }
                },
                child: Text(negActionTitle)));
          }
          return AlertDialog(content: Text(message), actions: actions);
        },
        barrierDismissible: isDismissible);
  }

}
