class InputValidations {
  static String? simpleInputValidation(String? value, {int? length}) {
    if (value == null || value.isEmpty) {
      return 'Preencha este campo';
    }
    if (length != null) {
      if (value.length < length) {
        return 'Insira pelo menos $length caracteres';
      }
    }
    return null;
  }
}
