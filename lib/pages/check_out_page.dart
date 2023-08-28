import 'package:flutter/material.dart';
import 'package:mobile_store/constants/size_config.dart';
import 'package:mobile_store/models/cart_product.dart';
import 'package:mobile_store/widgets/cart_tab.dart';
import '../constants/fetch_cart_product.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/payment_radio_button.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

  static String userFullName= 'Van Hai' ;
  static String userPhone= '0000000000' ;
  static String userAddress='Ly Thuong Kiet 6 ward, district 8, HoChiMinh city' ;
  static int discountPercent= 40 ;
  static int deliveryFee= 15 ;
  static int totalFee= 1500 ;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
    context: context,
    title: 'Mobile Store',
    logged: false,
    ),
      body: Container(
        margin: const EdgeInsets.all(9),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset(
                        'assets/img/address_img.png'),
                    const Text(
                      ' Delivery address',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9,),
              Container(
                child: Row(
                  children: [
                     Text(
                      "$userFullName | ",
                      style:const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      userPhone,
                      style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                     Text(
                      userAddress,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18,),
              Container(
                child: Row(
                  children: [
                    Image.asset(
                        'assets/img/payment_img.png'),
                    const Text(
                      ' Payment details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: const CartTab(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 171,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 9,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text(
                          ' Discount',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                         Text(
                          '$discountPercent %',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                  ]
                      ),
                      const SizedBox(height: 9,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[ Text(
                          ' Delivery fee',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                         Text(
                          '$deliveryFee USD',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                ]
                      ),
                      const SizedBox(height: 9,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text(
                          ' Total',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                         Text(
                          '${CartData().totalCart} USD',
                          style:const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                ]
                      ),
                    ],
                ),
                  ),
                ]
              ),
              const SizedBox(height: 16,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                    'Select form to pay :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const PaymentRadioButton(),
               Container(
                 width: 278,
                  height: 46,
                  decoration:const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print('abc');
                    },
                    child: const Text(
                        'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
