import 'package:advance_flutter/custom_form_field/custom_checkbox_form_field.dart';
import 'package:advance_flutter/custom_form_field/custom_form_field_mixin.dart';
import 'package:advance_flutter/custom_form_field/custom_validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with CustomFormFieldMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Custom Form Field'),
      ),
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formKey,
                onChanged: onFormChanged,
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: 'Ad Soyad',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        validator: (value) =>
                            CustomValidator(value: value).emptyCheckValidator(),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              'Surname',
                            )),
                      ),
                    ),
                    CustomCheckboxFormField(title: 'sefa'),
                    _submitButton(isStateValidate: isStateValidate)
                  ],
                )),
          )),
    );
  }
}

class _submitButton extends StatelessWidget {
  const _submitButton({
    super.key,
    required this.isStateValidate,
  });

  final ValueNotifier<bool> isStateValidate;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, widget) {
        return ElevatedButton(
            onPressed: value ? () {} : null,
            child: const Text('Send'));
      },
      valueListenable: isStateValidate,
    );
  }
}
