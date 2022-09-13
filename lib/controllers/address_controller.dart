import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/repositories/address_repository.dart';
import 'package:desafio_dart/utils/string_validators.dart';
import 'package:desafio_dart/utils/user_input_getters.dart';

class AddressController {
  final addressRepository = AddressRepository.getInstance();

  AddressController();

  Address create() {
    final stringValidators = StringValidators();

    final street = UserInput.receiveStringFromUser(
      errorMessage: "digite um logradouro válido",
      message: "digite o logradouro: ",
    );
    final number = UserInput.receiveStringFromUser(
      errorMessage: "digite um número válido",
      message: "digite o número: ",
    );
    final neighboorhood = UserInput.receiveStringFromUser(
      errorMessage: "",
      message: "digite o bairro",
    );
    final city = UserInput.receiveStringFromUser(
      errorMessage: "digite um cidade válido",
      message: "digite a cidade: ",
    );
    final complement = UserInput.receiveStringFromUser(
      errorMessage: "digite um complemento válido",
      message: "digite o complemento: ",
    );
    final zipCode = UserInput.receiveStringFromUser(
      errorMessage: "digite um cep válido",
      message: "digite o cep: ",
      validators: [
        stringValidators.isCepValid,
      ],
    );
    final state = UserInput.receiveStringFromUser(
      errorMessage: "digite um estado válido",
      message: "digite o estado: ",
    );

    final address = addressRepository.create(
      street: street,
      number: number,
      neighboorhood: neighboorhood,
      city: city,
      complement: complement,
      zipCode: zipCode,
      state: state,
    );

    return address;
  }

  Address getOneOrCreate() {
    Address? selectedAddress;

    int option = UserInput.receiveIntegerFromUser(
      start: 1,
      end: 2,
      message:
          "Deseja cadastrar novo endereço ou buscar um existente? \n\n1. Cadastrar novo\n2. Buscar existente",
      errorMessage: "Digita uma opção válida",
    );

    print("\n\n");

    while (selectedAddress == null) {
      switch (option) {
        case 1:
          selectedAddress = create();

          break;
        case 2:
          final addresses = addressRepository.getAll();

          for (final address in addresses) {
            final index = addresses.indexOf(address);
            print("${index + 1}) ${address.formatted()}");
          }

          final addressIndex = UserInput.receiveIntegerFromUser(
            message:
                "digite o indice do endereço que deseja selecionar, se deseja criar um novo digite 0: ",
            start: 0,
            end: addresses.length,
            errorMessage: "digite uma opção válida",
          );

          if (addressIndex == 0) {
            option = 1;
          } else {
            selectedAddress = addressRepository.findById(
              addresses[addressIndex - 1].id,
            );
          }

          break;
      }
    }
    return selectedAddress;
  }
}
