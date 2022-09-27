import 'package:equatable/equatable.dart';
import 'package:mobile_development_test/domain/entities/city.dart';

class CityModel extends Equatable {

  const CityModel({required this.name, required this.id});

  final String name;
  final String id;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'],
      id: json['id']);

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id
  };

  City toEntity() => City(
      name: name,
      id: id);

  @override
  List<Object?> get props => [
    name,
    id
  ];



}