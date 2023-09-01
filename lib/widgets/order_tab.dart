import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/services/order_data.dart';

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
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: Image.network(FetchOrder.baseUrl +
                          ('${orders[index].productOrderDTO?.image}')),
                      title: Text('${orders[index].productOrderDTO?.name}'),
                      subtitle:
                          Text('Delivery date: ${orders[index].receiveDate}'),
                      trailing: Text('${orders[index].total}'),
                    ),
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
