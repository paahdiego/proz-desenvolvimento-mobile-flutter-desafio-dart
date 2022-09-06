import 'package:desafio_dart/models/person.dart';

class PhysicalPerson extends Person {
  final String name;
  final String cpf;

  PhysicalPerson({
    required super.id,
    required this.name,
    required this.cpf,
    required super.address,
    required super.type,
    required super.createdAt,
  });
}
