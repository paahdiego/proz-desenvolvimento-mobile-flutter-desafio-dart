import 'package:validatorless/cnpj.dart';
import 'package:validatorless/cpf.dart';

class StringValidators {
  bool isCNPJValid(String document) {
    return CNPJValidator.isValid(document);
  }

  bool isCPFValid(String document) {
    return CpfValidator.isValid(document);
  }

  bool hasRequiredLength(String value, int length) {
    value = value.replaceAll(RegExp(r"\D"), "");
    return value.length == length;
  }

  bool isCepValid(String value) {
    return hasRequiredLength(value, 8);
  }
}
