import 'package:desafio_dart/controllers/address_controller.dart';
import 'package:desafio_dart/models/physical_person.dart';
import 'package:desafio_dart/repositories/physical_person_repository.dart';
import 'package:desafio_dart/utils/string_formatter.dart';
import 'package:desafio_dart/utils/string_validators.dart';
import 'package:desafio_dart/utils/user_input_getters.dart';

class PhysicalPersonController {
  final physicalPersonRepository = PhysicalPersonRepository.getInstance();

  PhysicalPerson create() {
    final stringValidator = StringValidators();
    final formatter = StringFormatter();
    final name = UserInput.receiveStringFromUser(
      message: "digite um nome",
      errorMessage: "digite um nome válido",
    );
    final cpf = UserInput.receiveStringFromUser(
      message: "digite um cpf",
      errorMessage: "digite um cpf válido",
      validators: [stringValidator.isCPFValid],
    );

    final addressController = AddressController();

    final selectedAddress = addressController.getOneOrCreate();

    final physicalPerson = physicalPersonRepository.create(
      name: name,
      cpf: formatter.formatCPF(cpf),
      address: selectedAddress,
    );

    return physicalPerson;
  }

  PhysicalPerson getOneOrCreate() {
    PhysicalPerson? selectedPhysicalPerson;

    int option = UserInput.receiveIntegerFromUser(
      start: 1,
      end: 2,
      message:
          "Deseja cadastrar nova pessoa física ou buscar uma existente? \n\n1. Cadastrar nova\n2. Buscar existente",
      errorMessage: "Digita uma opção válida",
    );

    print("\n\n");

    while (selectedPhysicalPerson == null) {
      switch (option) {
        case 1:
          selectedPhysicalPerson = create();

          break;
        case 2:
          final physicalPeople = physicalPersonRepository.getAll();

          for (final physicalPerson in physicalPeople) {
            final index = physicalPeople.indexOf(physicalPerson);
            print(
                "${index + 1})\nnome: ${physicalPerson.name}\ncpf: ${physicalPerson.cpf}\n");
          }

          final personIndex = UserInput.receiveIntegerFromUser(
            message:
                "digite o indice da pessoa que deseja selecionar, se deseja criar uma nova digite 0: ",
            start: 0,
            end: physicalPeople.length,
            errorMessage: "digite uma opção válida",
          );

          if (personIndex == 0) {
            option = 1;
          } else {
            selectedPhysicalPerson = physicalPersonRepository.findById(
              physicalPeople[personIndex - 1].id,
            );
          }

          break;
      }
    }
    return selectedPhysicalPerson;
  }
}
