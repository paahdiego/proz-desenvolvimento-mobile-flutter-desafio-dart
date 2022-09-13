import 'package:desafio_dart/controllers/address_controller.dart';
import 'package:desafio_dart/controllers/person_controller.dart';

import 'package:desafio_dart/models/company.dart';
import 'package:desafio_dart/models/person.dart';

import 'package:desafio_dart/repositories/company_repository.dart';
import 'package:desafio_dart/utils/string_validators.dart';

import 'package:desafio_dart/utils/user_input_getters.dart';

class CompanyController {
  final companyRepository = CompanyRepository.getInstance();

  Company createCompany() {
    final stringValidator = StringValidators();
    final corporateName = UserInput.receiveStringFromUser(
      message: "digite a razão social: ",
      errorMessage: "digite uma razão social válida",
    );
    final cnpj = UserInput.receiveStringFromUser(
      message: "digite o cnpj: ",
      errorMessage: "digite um cnpj válido",
      validators: [
        stringValidator.isCNPJValid,
      ],
    );
    final phone = UserInput.receiveStringFromUser(
      message: "digite o telefone: ",
      errorMessage: "digite um telefone válido",
    );
    final fantasyName = UserInput.receiveStringFromUser(
      message: "digite o nome fantasia: ",
      errorMessage: "digite um nome fantasia válido",
    );

    final addressController = AddressController();

    final selectedAddress = addressController.getOneOrCreate();

    final personController = PersonController();

    final selectedPartner = personController.getOneOrCreate();

    final createdCompany = companyRepository.create(
      fantasyName: fantasyName,
      corporateName: corporateName,
      cnpj: cnpj,
      phone: phone,
      address: selectedAddress,
      partner: selectedPartner,
    );

    return createdCompany;
  }

  void getCompanyByCNPJ() {
    final stringValidator = StringValidators();
    Company? company;

    do {
      final searchCnpj = UserInput.receiveStringFromUser(
        message: "informe o CNPJ",
        errorMessage: "Informe um CNPJ válido",
        validators: [stringValidator.isCNPJValid],
      );

      company = companyRepository.findByCNPJ(searchCnpj);

      if (company == null) {
        print("\nEmpresa não encontrada...CPNJ: $searchCnpj\n");

        final option = UserInput.receiveIntegerFromUser(
          message: "Deseja tentar novamente?\n\n1. SIM\n2. NÃO\n",
          start: 1,
          end: 2,
          errorMessage: "digite uma opção válida",
        );

        if (option == 2) break;
      }
    } while (company == null);

    if (company != null) {
      print(company.toStringFormatted());
    }
  }

  void getCompanyByPartnerDocument() {
    Company? company;

    final option = UserInput.receiveIntegerFromUser(
      message: "Deseja buscar por CPF ou CNPJ?\n\n1. CPF\n2. CNPJ\n",
      start: 1,
      end: 2,
      errorMessage: "digite uma opção válida",
    );

    do {
      final searchDocument = UserInput.receiveStringFromUser(
          message: "Digite o ${option == 1 ? "CPF" : "CNPJ"}: ",
          errorMessage: "digite um ${option == 1 ? "CPF" : "CNPJ"} válido",
          validators: [
            option == 1
                ? StringValidators().isCPFValid
                : StringValidators().isCNPJValid
          ]);

      if (option == 1) {
        company = companyRepository.findByPartnerDocument(
          document: searchDocument,
          type: PersonType.physical,
        );
      } else {
        company = companyRepository.findByPartnerDocument(
          document: searchDocument,
          type: PersonType.legal,
        );
      }

      if (company == null) {
        print(
            "\nEmpresa não encontrada...documento do sócio: $searchDocument\n");

        final option = UserInput.receiveIntegerFromUser(
          message: "Deseja tentar novamente?\n\n1. SIM\n2. NÃO\n",
          start: 1,
          end: 2,
          errorMessage: "digite uma opção válida",
        );

        if (option == 2) break;
      }
    } while (company == null);

    if (company != null) print(company.toStringFormatted());
  }

  void listCompaniesOrdenated() {
    final companies = companyRepository.getAll();

    companies.sort((a, b) => a.corporateName.compareTo(b.corporateName));

    for (final company in companies) {
      print(company.toStringFormatted());
    }
  }

  void deleteCompanyById() {
    int option = 1;
    String id = "";
    do {
      listCompaniesOrdenated();

      id = UserInput.receiveStringFromUser(
        message: "\ndigite o id que deseja deletar",
        errorMessage: "digite um id válido",
      );

      final company = companyRepository.findById(id);

      if (company == null) {
        print("\nEmpresa não encontrada...id: $id\n");

        option = UserInput.receiveIntegerFromUser(
          message: "Deseja tentar novamente?\n\n1. SIM\n2. NÃO\n",
          start: 1,
          end: 2,
          errorMessage: "digite uma opção válida",
        );
        if (option == 2) break;
      }
      if (company != null) {
        companyRepository.deleteById(id);
        break;
      }
    } while (true);

    if (option != 2) {
      print("\nEmpresa deletada: $id\n");
      listCompaniesOrdenated();
    }
  }
}
