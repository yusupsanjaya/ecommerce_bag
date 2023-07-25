import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/checkout/bloc/checkout_bloc.dart';
import '../../../bloc/get_product/bloc/get_product_bloc.dart';
import '../../../data/models/responses/list_product_resp.dart';

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({super.key});

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  void initState() {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsError) {
          return const Center(
            child: Text('data error'),
          );
        }
        if (state is GetProductsLoaded) {
          if (state.data.data!.isEmpty) {
            return const Center(
              child: Text('Data Empty'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final Product product = state.data.data![index];
              return Card(
                elevation: 2,
                // shadowColor: const Color(0xffEE4D2D),
                color: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: product.attributes!.image!,
                      child: SizedBox(
                        width: 150,
                        height: 120,
                        child: Image.network(product.attributes!.image!),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      product.attributes!.price!.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        product.attributes!.name!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 2,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<CheckoutBloc>()
                                        .add(AddToCartEvent(product: product));
                                  },
                                  child: Icon(
                                    Icons.add_shopping_cart,
                                    size: 20,
                                    color: Color.fromARGB(255, 52, 122, 233),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Beli",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 52, 122, 233),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      context.read<CheckoutBloc>().add(
                                          RemoveFromCartEvent(
                                              product: product));
                                    },
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      size: 18,
                                      color: Color.fromARGB(255, 52, 122, 233),
                                    )),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('0'),
                                ),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<CheckoutBloc>()
                                        .add(AddToCartEvent(product: product));
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 18,
                                    color: Color.fromARGB(255, 52, 122, 233),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: state.data.data!.length,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
