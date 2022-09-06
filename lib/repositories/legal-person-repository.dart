import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/models/legal-person.dart';
import 'package:desafio_dart/models/person.dart';
import 'package:uuid/uuid.dart';

class LegalPersonRepository {
  final _legalPeople = <LegalPerson>[];

  final uuid = Uuid();

  static LegalPersonRepository? _instance;

  static LegalPersonRepository getInstance() {
    if (_instance == null) {
      LegalPersonRepository._instance = LegalPersonRepository();
    }

    return LegalPersonRepository._instance!;
  }

  LegalPerson create({
    required String fantasyName,
    required String corporateName,
    required String cnpj,
    required Address address,
    required String phone,
  }) {
    final legalPerson = LegalPerson(
      createdAt: DateTime.now(),
      id: uuid.v1(),
      fantasyName: fantasyName,
      corporateName: corporateName,
      cnpj: cnpj,
      address: address,
      type: PersonType.legal,
    );

    _legalPeople.add(legalPerson);

    return legalPerson;
  }

  List<LegalPerson> getAll() {
    return _legalPeople;
  }

  LegalPerson? findById(String id) {
    final legalPerson = _legalPeople.firstWhere((element) => element.id == id);

    print(legalPerson);

    return null;
  }

  void deleteById(String id) {
    _legalPeople.removeWhere((element) => element.id == id);
  }
}
