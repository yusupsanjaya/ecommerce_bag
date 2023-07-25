import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/product_remote.dart';
import '../../../data/models/responses/list_product_resp.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemoteDatasource datasource;
  GetProductsBloc(this.datasource) : super(GetProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(GetProductsLoading());
      final result = await datasource.getAllProduct();
      result.fold(
        (l) => emit(GetProductsError()),
        (r) => emit(GetProductsLoaded(data: r)),
      );
    });
  }
}
