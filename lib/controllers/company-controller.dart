import 'package:desafio_dart/repositories/company-repository.dart';
import 'package:desafio_dart/utils/user-input-getters.dart';

class CompanyController {
  final companyRepository = CompanyRepository.getInstance();

// Cadastrar uma nova empresa;
  void createCompany() {
    final option = UserInput.receiveIntegerFromUser(
      start: 1,
      end: 2,
      message:
          "Deseja cadastrar novo endereço ou buscar um existente? \n\n 1. Cadastrar novo\n2. Buscar existente",
      errorMessage: "Digita uma opção válida",
    );

    switch (option) {
      case 1:

        // final addressController = AddressController(

        // );
        // final address =

        break;
      case 2:
        break;
    }

    // final company = companyRepository.create(
    //   address: Address,
    //   cnpj: '',
    //   corporateName: '',
    //   fantasyName: '',
    //   partner: null,
    //   phone: '',
    // );
  }

// Buscar Empresa cadastrada por CNPJ;
// Buscar Empresa por CPF/CNPJ do Sócio;
// Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);
// Excluir uma empresa (por ID);
// Sair.

}
