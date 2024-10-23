import 'package:flutter/material.dart';

class CustomCheckboxFormField extends FormField<bool> {
  CustomCheckboxFormField({super.key, required String title})
      : super(
          initialValue: false,
          validator: (bool? value) =>
              value ?? false ? null : 'Please fill the checkbox !',
          builder: (state) {
            return Row(
              children: [
                Expanded(
                    child: CheckboxListTile(
                  title: const Text('I agree to the terms and conditions'),
                  value: state.value,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) => state.didChange(value),
                )),
                if (state.hasError)
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
              ],
            );
          },
        );
}

class CustomTextFormField extends FormField<String> {
  CustomTextFormField(
    {required String label}
  )
      : super(
          initialValue: '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill the blank';
            }
            return null;
          },
          builder: (state) {
            return Row(
              children: [
                if (state.hasError) Icon(Icons.error),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: label
                    ),
                    onChanged: state.didChange,
                  ),
                )
              ],
            );
          },
        );
}
