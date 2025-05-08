import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    required this.viewModel,
    required this.onPageBuilder,
    this.onModelReady,
    this.onDispose,
    super.key,
  });

  final T viewModel;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final void Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
