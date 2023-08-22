import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/services/product_data.dart';

import '../models/product.dart';

class ListProduct extends StatefulWidget {
  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  late Future<List<Product>> futureListProducts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureListProducts = ProductData().getAllProduct(0, 5);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      return Container(
        child: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).detailPage();
                        },
                        child: FutureBuilder(
                          future: futureListProducts,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("Retrieve Failed\n ${snapshot.error}");
                            } else if (snapshot.hasData) {
                              final List<Product> products = snapshot.data!;
                              return ListView.builder(
                                itemCount: products.length,
                                itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    height: 177,
                                    width: 147,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 119,
                                          width: 126,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/img/samsung.jpg"))),
                                        ),
                                        Text(
                                          "${products[index].name}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "${products[index].price}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  91, 184, 93, 1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
