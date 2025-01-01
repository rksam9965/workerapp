import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

displayProgress(BuildContext context) {
  return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            child: Center(
              child: (Platform.isAndroid)
                  ? const CircularProgressIndicator()
                  : const CupertinoActivityIndicator(radius: 10),
            ),
            onWillPop: () async => false);
      });
}