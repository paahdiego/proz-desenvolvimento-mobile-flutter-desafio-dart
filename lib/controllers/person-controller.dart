import 'package:desafio_dart/controllers/legal-person-controller.dart';
import 'package:desafio_dart/controllers/physical-person-controller.dart';
import 'package:desafio_dart/models/person.dart';
import 'package:desafio_dart/utils/user-input-getters.dart';

class PersonController {
  final physicalPersonController = PhysicalPersonController();

  final legalPersonController = LegalPersonController();

  Person getOneOrCreate() {
    Person? selectedPerson;

    final personType = UserInput.receiveIntegerFromUser(
      start: 1,
      end: 2,
      errorMessage: "Escolha um tipo válido",
      message:
          "Escolha o tipo de pessoa: \n\n1. Pessoa Física\n2. Pessoa Juridica\n",
    );

    if (personType == 1) {
      selectedPerson = physicalPersonController.getOneOrCreate();
    } else {
      selectedPerson = legalPersonController.getOneOrCreate();
    }

    return selectedPerson;
  }
}
