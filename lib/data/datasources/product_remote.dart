import 'package:dartz/dartz.dart';

import '../../common/GlobalVatiables.dart';
import '../models/responses/list_product_resp.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ListproductResponseModel>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('${GlobalVariables.baseUrl}/api/products'));

    if (response.statusCode == 200) {
      return Right(ListproductResponseModel.fromRawJson(response.body));
    } else {
      return const Left('proses gagal');
    }
  }
}
