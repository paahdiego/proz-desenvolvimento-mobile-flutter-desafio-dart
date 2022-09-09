import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/models/object-id.dart';

abstract class Person extends ObjectId {
  final Address address;
  final PersonType type;

  Person({
    required super.id,
    required this.address,
    required this.type,
    required super.createdAt,
  });

  String personType() {
    switch (type) {
      case PersonType.physical:
        return "Pessoa Física";
      case PersonType.legal:
        return "Pessoa Juridica";
    }
  }

  @override
  String toString() => 'Person(address: $address)';
}

enum PersonType { physical, legal }
