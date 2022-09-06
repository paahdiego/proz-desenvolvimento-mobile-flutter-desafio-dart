import 'package:desafio_dart/controllers/company-controller.dart';
import 'package:desafio_dart/controllers/menu-controller.dart';
import 'package:desafio_dart/mock/mock-service.dart';
import 'package:desafio_dart/repositories/address-repository.dart';
import 'package:desafio_dart/repositories/company-repository.dart';
import 'package:desafio_dart/repositories/legal-person-repository.dart';
import 'package:desafio_dart/repositories/physical-person-repository.dart';

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
