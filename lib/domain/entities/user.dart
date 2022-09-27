import 'package:equatable/equatable.dart';

class User extends Equatable{
  const User({
    required this.name,
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


  @override
  List<Object?> get props => [
    name,
    address,
    email,
    phoneNumber,
    city,
    id
  ];

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "email": email,
    "phoneNumber": phoneNumber,
    "city": city,
  };

}