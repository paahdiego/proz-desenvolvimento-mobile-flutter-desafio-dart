import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/models/company.dart';
import 'package:desafio_dart/models/person.dart';
import 'package:desafio_dart/repositories/legal_person_repository.dart';
import 'package:desafio_dart/repositories/physical_person_repository.dart';
import 'package:desafio_dart/utils/string_formatter.dart';
import 'package:uuid/uuid.dart';

import '../models/company.dart';

class CompanyRepository {
  final _companies = <Company>[];

  final uuid = Uuid();

  static CompanyRepository? _instance;

  static CompanyRepository getInstance() {
    if (_instance == null) {
      CompanyRepository._instance = CompanyRepository();
    }

    return CompanyRepository._instance!;
  }

  Company create({
    required String fantasyName,
    required String corporateName,
    required String cnpj,
    required String phone,
    required Address address,
    required Person partner,
  }) {
    final formatter = StringFormatter();

    final company = Company(
      createdAt: DateTime.now(),
      id: uuid.v1(),
      fantasyName: fantasyName,
      corporateName: corporateName,
      cnpj: formatter.formatCNPJ(cnpj),
      address: address,
      phone: phone,
      partner: partner,
    );

    _companies.add(company);

    return company;
  }

  List<Company> getAll() {
    return _companies;
  }

  Company? findById(String id) {
    final exists = _companies.any((element) => element.id == id);

    if (!exists) return null;

    final company = _companies.firstWhere((element) => element.id == id);

    return company;
  }

  Company? findByCNPJ(String cnpj) {
    final formatter = StringFormatter();

    cnpj = formatter.formatCNPJ(cnpj);

    final exists = _companies.any((element) => element.cnpj == cnpj);

    if (!exists) return null;

    final company = _companies.firstWhere((element) => element.cnpj == cnpj);

    return company;
  }

  Company? findByPartnerDocument({
    required String document,
    required PersonType type,
  }) {
    String? companyId;
    final formatter = StringFormatter();
    for (final company in _companies) {
      if (company.partner.type == type) {
        switch (type) {
          case PersonType.physical:
            final physicalPersonRepository =
                PhysicalPersonRepository.getInstance();
            final partnerData = physicalPersonRepository.findById(
              company.partner.id,
            );
            if (partnerData != null &&
                partnerData.cpf == formatter.formatCPF(document)) {
              companyId = company.id;
            }
            break;
          case PersonType.legal:
            final legalPersonRepository = LegalPersonRepository.getInstance();
            final partnerData = legalPersonRepository.findById(
              company.partner.id,
            );
            if (partnerData != null &&
                partnerData.cnpj == formatter.formatCNPJ(document)) {
              companyId = company.id;
            }
            break;
        }
      }
    }

    if (companyId == null) return null;

    final company = _companies.firstWhere((element) => element.id == companyId);

    return company;
  }

  void deleteById(String id) {
    _companies.removeWhere((element) => element.id == id);
  }
}
