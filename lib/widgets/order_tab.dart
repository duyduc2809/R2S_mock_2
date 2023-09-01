import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/services/order_data.dart';

import '../constants/color_const.dart';
import '../models/order.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  late Future<List<Order>> futureListOrder;

  void initState() {
    // TODO: implement initState
    super.initState();
    futureListOrder = FetchOrder().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
      color: Colors.white,
      child: FutureBuilder(
          future: futureListOrder,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Retrive Failed${snapshot.error}');
            } else if (snapshot.hasData) {
              final List<Order> orders = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  itemBuilder: (context, index) => ListTile(
                    tileColor: Colors.white,
                    leading: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        width: 95,
                        height: 95,
                        child: Image.network(
                          FetchOrder.baseUrl +
                              ('${orders[index].productOrderDTO?.image}'),
                        ),
                      ),
                    ),
                    title: Text(
                      '${orders[index].productOrderDTO?.name}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(children: [
                      Text(
                        'Delivery date: ${orders[index].receiveDate}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                      Row(
                        children: [
                          Text(
                            '${orders[index].total}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.green),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: ColorPallete.mainColor,
                                fixedSize: const Size(90, 20)),
                            child: const Text(
                              'Detail',
                              style: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ]),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
