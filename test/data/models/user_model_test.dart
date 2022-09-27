import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:mobile_development_test/domain/entities/user.dart';

void main() {
  const tUserModel = UserModel(
      name: "WAHYU",
      address: "JL Lio Baru",
      email: "waahyuudev@gmail.com",
      phoneNumber: "083897487415",
      city: "Tangerang",
      id: "1");

  const tUser = User(name: "WAHYU",
      address: "JL Lio Baru",
      email: "waahyuudev@gmail.com",
      phoneNumber: "083897487415",
      city: "Tangerang",
      id: "1");

  group('to entity', () {
    test('should be a subclass of user entity', () async {
      final result = tUserModel.toEntity();
      expect(result, equals(tUser));
    });
  });
}
