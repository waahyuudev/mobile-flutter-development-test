import 'package:equatable/equatable.dart';

class City extends Equatable {

  const City({required this.name, required this.id});

  final String name;
  final String id;

  @override
  List<Object?> get props => [
    name,
    id
  ];

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id
  };

}
