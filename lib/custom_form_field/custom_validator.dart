final class CustomValidator {
  final String? value;

  CustomValidator({required this.value});

  String? emptyCheckValidator() {
    if (value == null || value!.isEmpty) {
      return 'Please fill the fields';
    }
    return null;
  }
}
