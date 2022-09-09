import 'package:validatorless/cnpj.dart';
import 'package:validatorless/cpf.dart';

class StringValidators {
  static bool isCNPJValid(String document) {
    return CNPJValidator.isValid(document);
  }

  static bool isCPFValid(String document) {
    return CpfValidator.isValid(document);
  }
}
