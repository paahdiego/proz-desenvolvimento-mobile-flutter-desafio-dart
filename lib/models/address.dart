import 'dart:convert';

import 'package:desafio_dart/models/object_id.dart';

class Address extends ObjectId {
  final String street;
  final String number;
  final String neighboorhood;
  final String city;
  final String complement;
  final String zipCode;
  final String state;

  Address({
    required super.id,
    required this.street,
    required this.number,
    required this.neighboorhood,
    required this.city,
    required this.complement,
    required this.zipCode,
    required this.state,
    required super.createdAt,
  });

  String formatted() {
    return "$street, $number - $neighboorhood - $city, $state - $zipCode - $complement";
  }

  @override
  String toString() {
    return 'Address(id: $id, street: $street, number: $number, neighboorhood: $neighboorhood, city: $city, complement: $complement, zipCode: $zipCode, state: $state, createdAt: $createdAt)';
  }
}
