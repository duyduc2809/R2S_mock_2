import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/widget/product_cart.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool click1 = true;
  bool click2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is CartState) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              logged: true,
              title: '',
              showUserInfo: true,
              context: context,
              user: AppCubits.userData,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 26, bottom: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 48,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xffda534d)),
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 16,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.white),
                                                child: const Center(
                                                  child: Text(
                                                    "x",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffda534d)),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Clear cart")
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ProductCart(),
                              ProductCart(),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                        text: "Temporary price: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        children: <InlineSpan>[
                                          TextSpan(
                                              text: "  2807 USD",
                                              style: TextStyle(
                                                  color: Colors.green))
                                        ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "ADDRESS",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        click1 = !click1;
                                      });
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset((click1 == true)
                                          ? 'assets/img/radio.png'
                                          : 'assets/img/radio_select.png'),
                                    ),
                                  ),
                                  const Text.rich(
                                    TextSpan(
                                        text: "Tran Ky Anh ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        children: [
                                          TextSpan(
                                              text: "| 0583841958",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "\n 515 a2-07 Le Van Luong",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text:
                                                  "\n Tan Phong ward, district 7, HoChiMinh city",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        click1 = !click1;
                                      });
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset((click1 == true)
                                          ? 'assets/img/radio.png'
                                          : 'assets/img/radio_select.png'),
                                    ),
                                  ),
                                  const Text.rich(
                                    TextSpan(
                                        text: "Tran Ky Anh ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        children: [
                                          TextSpan(
                                              text: "| 0583841958",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "\n 515 a2-07 Le Van Luong",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text:
                                                  "\n Tan Phong ward, district 7, HoChiMinh city",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "DISCOUNT",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text("Add another address"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 196,
                                  height: 26,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Image.asset(
                                          "assets/img/discount.png",
                                          width: 16,
                                          height: 16,
                                        ),
                                      ),
                                      Text(
                                        "Enter the discount code",
                                        style: TextStyle(
                                            color: Colors.grey.withOpacity(1)),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  width: 61,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff5bb85d)),
                                  child: const Center(
                                      child: Text(
                                    "Apply",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 170,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xff5bb85d)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/img/left_circle.png"
                                          ),
                                          const SizedBox(width: 10,),
                                          const Text("Continue Shopping", style: TextStyle(
                                            color: Colors.white
                                          ),)
                                        ],
                                      ),),
                                      Container(
                                  width: 115,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffefac4e)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/img/cart.png"
                                          ),
                                          const SizedBox(width: 10,),
                                          const Text("Check out", style: TextStyle(
                                            color: Colors.white
                                          ),)
                                        ],
                                      ),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
