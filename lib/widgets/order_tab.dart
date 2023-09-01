import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 9),
      height: MediaQuery.of(context).size.height * 0.56,
      width: double.maxFinite,
      color: Colors.white,
      child: FutureBuilder(
          future: futureListOrder,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Retrive Failed${snapshot.error}');
            } else if (snapshot.hasData) {
              final List<Order> orders = snapshot.data!;
              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  itemBuilder: (context, index) => ListTile(
                    tileColor: Colors.white,
                    leading: Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 95,
                                height: 48,
                                child: Image.network(
                                  FetchOrder.baseUrl +
                                      ('${orders[index].productOrderDTO?.image}'),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${orders[index].productOrderDTO?.name}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Delivery date: ${orders[index].receiveDate}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Order number: ${orders[index].productOrderDTO?.seri}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300),
                          ),
                        ]),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${formatNumber(orders[index].total!.toInt())} VND',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: ColorPallete.mainColor,
                              fixedSize: const Size(80, 20)),
                          child: const Text(
                            'Detail',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {},
                        )
                      ],
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

  String formatNumber(int number) {
    final NumberFormat formatter = NumberFormat('#,##0', 'vi_VN');
    return formatter.format(number);
  }
}
