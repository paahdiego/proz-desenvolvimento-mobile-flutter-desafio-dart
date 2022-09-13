import 'package:desafio_dart/controllers/menu_controller.dart';
import 'package:desafio_dart/mock/mock_service.dart';
import 'package:desafio_dart/repositories/address_repository.dart';
import 'package:desafio_dart/repositories/company_repository.dart';
import 'package:desafio_dart/repositories/legal_person_repository.dart';
import 'package:desafio_dart/repositories/physical_person_repository.dart';

class MyAppController {
  final bool activateMockedService;

  final companyRepository = CompanyRepository.getInstance();

  final addressRepository = AddressRepository.getInstance();

  final physicalPersonRepository = PhysicalPersonRepository.getInstance();

  final legalPersonRepository = LegalPersonRepository.getInstance();

  MyAppController({
    this.activateMockedService = false,
  });

  void runApp() {
    if (activateMockedService) {
      MockService();
    }

    final menuController = MenuController();

    menuController.startMenu();
  }
}
