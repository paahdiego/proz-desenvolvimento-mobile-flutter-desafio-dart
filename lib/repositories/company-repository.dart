import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/models/company.dart';
import 'package:desafio_dart/models/person.dart';
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
    final company = Company(
      createdAt: DateTime.now(),
      id: uuid.v1(),
      fantasyName: fantasyName,
      corporateName: corporateName,
      cnpj: cnpj,
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
    final exists = _companies.any((element) => element.cnpj == cnpj);

    if (!exists) return null;
    final company = _companies.firstWhere((element) => element.cnpj == cnpj);

    return company;
  }

  void deleteById(String id) {
    _companies.removeWhere((element) => element.id == id);
  }
}
