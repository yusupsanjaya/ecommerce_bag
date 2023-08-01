import 'package:ecommerce_bag/data/models/order_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/order_remote_datasource.dart';
import '../../data/models/responses/order_response_model.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource datasource;
  OrderBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_doOrder>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.order(event.model);
      result.fold(
        (l) => emit(const _Error()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
