import 'package:dartz/dartz.dart';

import '../../common/GlobalVatiables.dart';
import '../models/order_request_model.dart';
import '../models/responses/order_response_model.dart';

import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel model) async {
    //  final tokenJwt = await AuthLocalDatasource().getToken();
    print(model.toRawJson());
    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer e1a7de4c06f1115c5d8633df9b5a82b779969e4cb82ce84f00538b3583fd955e4187c98188fdbf352501e7422ff5e7118ba52607c367891cfeb6e616f0198763ccdd7c6b14d7b01b152032722b70554f6b563761d9c8c57a79187edb93e4e1ea3aa17349de823bab2c0ff54141e492805017c8dfc6434495ebdf5643d0c462b4'
      },
      body: model.toRawJson(),
    );

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
