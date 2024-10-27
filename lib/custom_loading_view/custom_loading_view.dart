import 'package:advance_flutter/custom_loading_view/widget/future_extension.dart';
import 'package:flutter/material.dart';

class CustomLoadingView extends StatefulWidget {
  const CustomLoadingView({super.key});

  @override
  State<CustomLoadingView> createState() => _CustomLoadingViewState();
}

class _CustomLoadingViewState extends State<CustomLoadingView> {
  /// Example Future Request
  Future<String> getSampleRequest() async {
    await Future.delayed(const Duration(seconds: 2));
    // return Future.error(Exception('Test Error'));
    return 'test';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final request =
                  getSampleRequest().showLoadingWhileFuture(context: context);
              print(request);
            },
            child: const Text('Get Request')),
      ),
    );
  }
}
