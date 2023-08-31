import 'package:flutter/material.dart';
import 'package:mobile_store/constants/fetch_promotion.dart';
import 'package:mobile_store/models/cart_product.dart';
import '../models/promotion.dart';
import '../constants/fetch_cart_product.dart';

class CartData {
  static final CartData _instance = CartData._internal();
  double totalCart = 0.0;

  factory CartData() {
    return _instance;
  }

  CartData._internal();
}

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final CartData cartData = CartData();
  late Future<List<CartProduct>> futureListCartProduct;
  late num totalCart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureListCartProduct = FetchCartProduct().getCartProduct(0);
  }

  num sumPrice(double price,int quantity){
    return price * quantity;
  }
  static int discountPercent= 40 ;
  static int deliveryFee= 15 ;
  static int totalFee= 1500 ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: futureListCartProduct,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Retrieve Failed${snapshot.error}");
            } else if (snapshot.hasData) {
              final List<CartProduct> products = snapshot.data!;
              totalCart = FetchCartProduct().calculateTotal(products);
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Image.asset('assets/img/iphone_img.png'),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' ${products[index].name}'),
                             Text(
                               ' ${products[index].color}, ${products[index].memory}',
                               style: TextStyle(
                                 color: Colors.black.withOpacity(0.5),
                               ),
                             ),
                            Text(
                              'quantity: ${products[index].quantity}',
                              style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                              const SizedBox(height: 9,),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text(
                        '${sumPrice(products[index].price, products[index].quantity)} USD',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
    );
  }
}
