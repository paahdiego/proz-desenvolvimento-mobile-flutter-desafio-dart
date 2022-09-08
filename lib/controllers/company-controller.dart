import 'package:desafio_dart/controllers/address-controller.dart';
import 'package:desafio_dart/controllers/person-controller.dart';

import 'package:desafio_dart/models/company.dart';

import 'package:desafio_dart/repositories/company-repository.dart';
import 'package:desafio_dart/utils/user-input-getters.dart';

class CompanyController {
  final companyRepository = CompanyRepository.getInstance();

  Company createCompany() {
    final corporateName = UserInput.receiveStringFromUser(
      message: "digite a razão social: ",
      errorMessage: "digite uma razão social válida",
    );
    final cnpj = UserInput.receiveStringFromUser(
      message: "digite o cnpj: ",
      errorMessage: "digite um cnpj válido",
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
    final searchCnpj = UserInput.receiveStringFromUser(
      message: "informe o cnpj",
    );

    final company = companyRepository.findByCNPJ(searchCnpj);

    print(company);
  }

// Buscar Empresa cadastrada por CNPJ;
// Buscar Empresa por CPF/CNPJ do Sócio;
// Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);
// Excluir uma empresa (por ID);
// Sair.

}
