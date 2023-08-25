import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/services/product_data.dart';

import '../models/product.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  late Future<List<Product>> futureListProducts;
  @override
  void initState() {
    super.initState();
    futureListProducts = ProductData().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      return Center(
        child:
            InkWell(
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
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 2
                  ),
                  scrollDirection: Axis.vertical,

                  itemCount: products.length,

                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 177,
                      width: 147,
                      child: Column(
                        children: [
                          Container(
                            height: 109,
                            width: 106,
                            decoration:  BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        // NetworkImage("http://45.117.170.206:60/apis/file/display/${products[index].images}"))
                                        AssetImage("assets/img/samsung.jpg"))
                                        ),
                          ),
                          Text("${products[index].name}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                          Text(
                            "${products[index].price}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(91, 184, 93, 1)),
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
      );
    });
  }
}