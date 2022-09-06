import 'dart:math';

import 'package:desafio_dart/mock/mocked-lists.dart';

import 'package:desafio_dart/repositories/address-repository.dart';
import 'package:desafio_dart/repositories/company-repository.dart';
import 'package:desafio_dart/repositories/legal-person-repository.dart';
import 'package:desafio_dart/repositories/physical-person-repository.dart';

class MockService {
  final addressRepository = AddressRepository.getInstance();

  final companyRepository = CompanyRepository.getInstance();

  final legalPersonRepository = LegalPersonRepository.getInstance();

  final physicalPersonRepository = PhysicalPersonRepository.getInstance();

  MockService() {
    _initialize();
  }

  void _initialize() {
    _createAddresses();
    _createPhysicalPeople();
    _createLegalPeople();
    _createCompanies();
    print("loaded mocked data...\n");
  }

  void _createAddresses() {
    for (final address in MockedLists.mockedAddresses) {
      addressRepository.create(
        street: address["street"],
        number: address["number"],
        neighboorhood: address["neighboorhood"],
        city: address["city"],
        complement: address["complement"],
        zipCode: address["zipCode"],
        state: address["state"],
      );
    }
  }

  void _createPhysicalPeople() {
    for (final physicalPerson in MockedLists.mockedPhysicalPeople) {
      final address = addressRepository.create(
        street: physicalPerson["street"],
        number: physicalPerson["number"],
        neighboorhood: physicalPerson["neighboorhood"],
        city: physicalPerson["city"],
        complement: physicalPerson["complement"],
        zipCode: physicalPerson["zipCode"],
        state: physicalPerson["state"],
      );

      physicalPersonRepository.create(
        address: address,
        cpf: physicalPerson["cpf"],
        name: physicalPerson["name"],
      );
    }
  }

  void _createLegalPeople() {
    for (final physicalPerson in MockedLists.mockedLegalPeople) {
      final address = addressRepository.create(
        street: physicalPerson["street"],
        number: physicalPerson["number"],
        neighboorhood: physicalPerson["neighboorhood"],
        city: physicalPerson["city"],
        complement: physicalPerson["complement"],
        zipCode: physicalPerson["zipCode"],
        state: physicalPerson["state"],
      );

      legalPersonRepository.create(
        address: address,
        cnpj: physicalPerson["cnpj"],
        corporateName: physicalPerson["corporateName"],
        fantasyName: physicalPerson["fantasyName"],
        phone: physicalPerson["phone"],
      );
    }
  }

  void _createCompanies() {
    final addresses = addressRepository.getAll();
    final physicalPeople = physicalPersonRepository.getAll();
    final legalPeople = legalPersonRepository.getAll();

    final random = Random();

    bool flipper = false;

    for (final company in MockedLists.mockedCompanies) {
      final indexAddress = random.nextInt(addresses.length);
      final indexPhysicalPerson = random.nextInt(physicalPeople.length);
      final indexLegalPerson = random.nextInt(legalPeople.length);

      final address = addresses[indexAddress];

      final partner = flipper
          ? physicalPeople[indexPhysicalPerson]
          : legalPeople[indexLegalPerson];

      companyRepository.create(
        fantasyName: company["fantasyName"],
        corporateName: company["corporateName"],
        cnpj: company["cnpj"],
        address: address,
        phone: company["phone"],
        partner: partner,
      );

      flipper = !flipper;
    }
  }
}
