import 'package:advance_flutter/custom_form_field/custom_form_view.dart';
import 'package:flutter/material.dart';

mixin CustomFormFieldMixin on State<CustomTextField> {
  final GlobalKey<FormState> formKey = GlobalKey();

  ValueNotifier<bool> isStateValidate = ValueNotifier(false);

  void onFormChanged() {
    isStateValidate.value = formKey.currentState!.validate();
  }
}
