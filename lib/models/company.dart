import 'package:desafio_dart/models/address.dart';

import 'package:desafio_dart/models/object_id.dart';
import 'package:desafio_dart/models/person.dart';

import 'package:desafio_dart/repositories/legal_person_repository.dart';
import 'package:desafio_dart/repositories/physical_person_repository.dart';

class Company extends ObjectId {
  final String fantasyName;
  final String corporateName;
  final String cnpj;
  final Address address;
  final String phone;
  final Person partner;

  Company({
    required super.id,
    required this.fantasyName,
    required this.corporateName,
    required this.cnpj,
    required this.address,
    required this.phone,
    required this.partner,
    required super.createdAt,
  });

  @override
  String toString() {
    return 'Company(id: $id, fantasyName: $fantasyName, corporateName: $corporateName, cnpj: $cnpj, address: $address, phone: $phone, partnet: $partner, createdAt: $createdAt)';
  }

  String toStringFormatted() {
    String companyDetails = "\nID: $id";

    companyDetails += "\nCNPJ: $cnpj \t Data de Cadastro: $createdAt";
    companyDetails += "\nRazão Social: $corporateName";
    companyDetails += "\nNome Fantasia: $fantasyName";
    companyDetails += "\nTelefone: $phone";
    companyDetails += "\nEndereço: ${address.formatted()}";
    companyDetails += "\nSócio: ${partner.personType()}";
    if (partner.type == PersonType.legal) {
      final legalPerson = LegalPersonRepository.getInstance();

      final partnerData = legalPerson.findById(partner.id);
      if (partnerData != null) {
        companyDetails += "\nRazão Social: ${partnerData.corporateName}";
        companyDetails += "\nNome Fantasia: ${partnerData.fantasyName}";
        companyDetails += "\nCNPJ: ${partnerData.cnpj}";
        companyDetails += "\nEndereço: ${partnerData.address.formatted()}\n";
      }
    } else {
      final physicalPhysical = PhysicalPersonRepository.getInstance();

      final partnerData = physicalPhysical.findById(partner.id);
      if (partnerData != null) {
        companyDetails += "\nNome: ${partnerData.name}";
        companyDetails += "\nCPF: ${partnerData.cpf}";
        companyDetails += "\nEndereço: ${partnerData.address.formatted()}\n";
      }
    }

    return companyDetails;
  }
}
