import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/widget/product_cart.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if(state is UserLoadedState){
          return Scaffold(
      backgroundColor: Colors.white,
        appBar: CustomAppBar(
              logged: true,
              title: '',
              showUserInfo: true,
              context: context,
              user: state.user,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            child: const Center(
                                              child: Text(
                                                "x",
                                                style: TextStyle(
                                                    color: Color(0xffda534d)),
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
                          SizedBox(height: 10,),
                          Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Temporary price: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(text: "  2807 USD",style: TextStyle(
                                      color: Colors.green
                                    ))
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("ADDRESS",
                          style: TextStyle(
                            fontWeight: FontWeight.w400
                          ),),
                          Row(
                            children: [
                              
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        );
        
      } else {
        return const Center(child: CircularProgressIndicator());
      }});
  }
}
