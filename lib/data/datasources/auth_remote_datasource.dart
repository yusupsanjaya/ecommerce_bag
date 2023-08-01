
import 'package:dartz/dartz.dart';

import '../../common/GlobalVatiables.dart';
import '../models/login_request_model.dart';
import 'package:http/http.dart' as http;
import '../models/responses/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/auth/local'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromRawJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}