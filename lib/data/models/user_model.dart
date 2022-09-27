import 'package:equatable/equatable.dart';
import 'package:mobile_development_test/domain/entities/user.dart';

class UserModel extends Equatable {
  const UserModel(
      {required this.name,
      required this.address,
      required this.email,
      required this.phoneNumber,
      required this.city,
      required this.id});

  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String city;
  final String id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      address: json['address'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'email': email,
        'phoneNumber': phoneNumber,
        'city': city,
        'id': id,
      };

  User toEntity() => User(
      name: name,
      address: address,
      email: email,
      phoneNumber: phoneNumber,
      city: city,
      id: id);

  @override
  List<Object?> get props => [name, address, email, phoneNumber, city, id];
}
