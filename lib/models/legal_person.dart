import 'package:desafio_dart/models/person.dart';

class LegalPerson extends Person {
  final String fantasyName;
  final String corporateName;
  final String cnpj;

  LegalPerson({
    required super.id,
    required this.cnpj,
    required this.fantasyName,
    required this.corporateName,
    required super.address,
    required super.type,
    required super.createdAt,
  });

  @override
  String toString() {
    return 'LegalPerson(id: $id,fantasyName: $fantasyName, corporateName: $corporateName, cnpj: $cnpj, addressId: $address, createdAt: $createdAt)';
  }
}
