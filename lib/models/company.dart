import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/models/object-id.dart';
import 'package:desafio_dart/models/person.dart';

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
}
