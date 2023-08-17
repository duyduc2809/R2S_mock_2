import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/models/product.dart';

class ListProduct extends StatefulWidget {
  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitsStates>(builder: (context, state) {
        if (state is LoadedState) {
          var info = state.products;
          return Container(
            child: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Card(
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
                                    "Samsung",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    "599 USD",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(91, 184, 93, 1)),
                                  ),
                                ],
                              ),
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
        }
      }),
    );
  }
}
