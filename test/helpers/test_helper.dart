import 'package:mobile_development_test/data/datasources/remote_data_source.dart';
import 'package:mobile_development_test/domain/repositories/user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    UserRepository,
    RemoteDataSource
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}