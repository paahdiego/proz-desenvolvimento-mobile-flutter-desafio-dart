import 'package:desafio_dart/repositories/address-repository.dart';
import 'package:desafio_dart/utils/user-input-getters.dart';

class AddressController {
  final AddressRepository addressRepository;

  AddressController({
    required this.addressRepository,
  });

  createAddress() {
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
}
