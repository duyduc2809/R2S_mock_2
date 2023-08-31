import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/widgets/product_widgets/product_cart.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is CartPageState) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
                logged: true,
                title: '',
                showUserInfo: true,
                context: context,
                user: AppCubits.userData),
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
                                        text: "Grand total: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "ADDRESS",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            click = !click;
                                          });
                                        },
                                        child: SizedBox(
                                          child: Image.asset((click == true)
                                              ? "assets/img/radio.png"
                                              : "assets/img/radio_select.png"),
                                        ),
                                      ),
                                      const Text.rich(TextSpan(
                                          text: "Tran Ky Anh ",
                                          children: [
                                            TextSpan(
                                                text: " | 0583841958 ",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            TextSpan(
                                                text:
                                                    "\n 515 a2-07 Le Van Luong ",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            TextSpan(
                                                text:
                                                    "\n Tan Phong ward, district 7, HoChiMinh city",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ])),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 60, top: 10, bottom: 5),
                                child: Text(
                                  "Add another address",
                                  style: TextStyle(
                                    color: Color.fromRGBO(80, 155, 210, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 170,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xff5bb85d)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            child: Image.asset(
                                                "assets/img/left_circle.png"),
                                          ),
                                          const Text(
                                            "Continue Shopping",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffefac4e)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            child: Image.asset(
                                                "assets/img/cart.png"),
                                          ),
                                          const Text(
                                            "Check out",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
