import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({super.key});

  /// Method for show loading while future methods
  static Future<T?> show<T>(
      {required BuildContext context, required Future<T> future}) async {
    unawaited(showDialog(
      context: context,
      builder: (context) => const LoadingAlertDialog(),
    ));

    try {
      final request = await future;

      return request;
    } catch (e) {
      return null;
    } finally {
      if (context.mounted) {
        context.route.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Wrap(
        children: [
          Column(
            children: [
              Text('Loading ...'),
              SizedBox(
                height: 24,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
