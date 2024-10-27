import 'package:advance_flutter/custom_loading_view/widget/loading_alert_dialog.dart';
import 'package:flutter/material.dart';

extension CustomFutureLoading<T> on Future<T> {
  Future<T?> showLoadingWhileFuture ({required BuildContext context}) async {
    final request =
        await LoadingAlertDialog.show(context: context, future: this);
    return request;
  }
}