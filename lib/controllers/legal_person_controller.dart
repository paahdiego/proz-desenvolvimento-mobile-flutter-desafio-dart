import 'package:desafio_dart/controllers/address_controller.dart';
import 'package:desafio_dart/models/legal_person.dart';

import 'package:desafio_dart/repositories/legal_person_repository.dart';
import 'package:desafio_dart/utils/string_formatter.dart';
import 'package:desafio_dart/utils/string_validators.dart';

import 'package:desafio_dart/utils/user_input_getters.dart';

class LegalPersonController {
  final legalPersonRepository = LegalPersonRepository.getInstance();

  final stringValidator = StringValidators();
  final formatter = StringFormatter();

  LegalPerson create() {
    final cnpj = UserInput.receiveStringFromUser(
      message: "digite o cnpj: ",
      errorMessage: "digite um cnpj válido",
      validators: [stringValidator.isCNPJValid],
    );
    final fantasyName = UserInput.receiveStringFromUser(
      message: "digite o nome fantasia: ",
      errorMessage: "digite um nome fantasia válido",
    );
    final corporateName = UserInput.receiveStringFromUser(
      message: "digite a razão social: ",
      errorMessage: "digite uma razão social válida",
    );
    final phone = UserInput.receiveStringFromUser(
      message: "digite telefone: ",
    );

    final addressController = AddressController();

    final selectedAddress = addressController.getOneOrCreate();

    final legalPerson = legalPersonRepository.create(
      cnpj: formatter.formatCNPJ(cnpj),
      corporateName: fantasyName,
      fantasyName: corporateName,
      address: selectedAddress,
      phone: phone,
    );

    return legalPerson;
  }

  LegalPerson getOneOrCreate() {
    LegalPerson? selectedLegalPerson;

    int option = UserInput.receiveIntegerFromUser(
      start: 1,
      end: 2,
      message:
          "Deseja cadastrar nova pessoa juridica ou buscar uma existente? \n\n1. Cadastrar nova\n2. Buscar existente",
      errorMessage: "Digita uma opção válida",
    );

    print("\n\n");

    while (selectedLegalPerson == null) {
      switch (option) {
        case 1:
          selectedLegalPerson = create();

          break;
        case 2:
          final legalPeople = legalPersonRepository.getAll();

          for (final legalPerson in legalPeople) {
            final index = legalPeople.indexOf(legalPerson);
            print(
              "${index + 1})\nnome fantasia: ${legalPerson.fantasyName}\ncnpj: ${legalPerson.cnpj}\n",
            );
          }

          final personIndex = UserInput.receiveIntegerFromUser(
            message:
                "digite o indice da pessoa que deseja selecionar, se deseja criar uma nova digite 0: ",
            start: 0,
            end: legalPeople.length,
            errorMessage: "digite uma opção válida",
          );

          if (personIndex == 0) {
            option = 1;
          } else {
            selectedLegalPerson = legalPersonRepository.findById(
              legalPeople[personIndex - 1].id,
            );
          }

          break;
      }
    }
    return selectedLegalPerson;
  }
}
