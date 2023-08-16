import 'package:flutter/material.dart';
import 'package:mobile_store/models/product.dart';

class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product;
    return 
    Container(
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
                                        image:
                                            AssetImage("assets/img/samsung.jpg"))),
                              ),
                               Text(product.name
                                  ,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                "5999 USD",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(91, 184, 93, 1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15.0),
                      //   ),
                      //   child: Container(
                      //     height: 177,
                      //     width: 147,
                      //     child: Column(
                      //       children: <Widget>[
                      //         Container(
                      //           height: 119,
                      //           width: 126,
                      //           decoration: const BoxDecoration(
                      //               image: DecorationImage(
                      //                   image:
                      //                       AssetImage("assets/img/samsung.jpg"))),
                      //         ),
                      //         const Text(
                      //           "GALAXY S8",
                      //           style: TextStyle(
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //         const Text(
                      //           "599 USD",
                      //           style: TextStyle(
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.w700,
                      //               color: Color.fromRGBO(91, 184, 93, 1)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}
