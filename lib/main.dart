import 'package:ecommerce_bag/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/order_bloc.dart';
import 'bloc/checkout/bloc/checkout_bloc.dart';
import 'bloc/get_product/bloc/get_product_bloc.dart';
import 'bloc/login/bloc/login_bloc.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/order_remote_datasource.dart';
import 'data/datasources/product_remote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductsBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
