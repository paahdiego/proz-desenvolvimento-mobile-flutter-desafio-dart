import 'package:desafio_dart/models/address.dart';
import 'package:desafio_dart/models/person.dart';
import 'package:desafio_dart/models/physical-person.dart';
import 'package:uuid/uuid.dart';

class PhysicalPersonRepository {
  final _physicalPeople = <PhysicalPerson>[];

  final uuid = Uuid();

  static PhysicalPersonRepository? _instance;

  static PhysicalPersonRepository getInstance() {
    if (_instance == null) {
      PhysicalPersonRepository._instance = PhysicalPersonRepository();
    }

    return PhysicalPersonRepository._instance!;
  }

  PhysicalPerson create({
    required String name,
    required String cpf,
    required Address address,
  }) {
    final physicalPerson = PhysicalPerson(
      createdAt: DateTime.now(),
      id: uuid.v1(),
      name: name,
      cpf: cpf,
      address: address,
      type: PersonType.physical,
    );

    _physicalPeople.add(physicalPerson);

    return physicalPerson;
  }

  List<PhysicalPerson> getAll() {
    return _physicalPeople;
  }

  PhysicalPerson? findById(String id) {
    final physicalPerson =
        _physicalPeople.firstWhere((element) => element.id == id);

    return physicalPerson;
  }

  void deleteById(String id) {
    _physicalPeople.removeWhere((element) => element.id == id);
  }
}
