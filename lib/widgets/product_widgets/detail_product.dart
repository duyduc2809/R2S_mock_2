import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/pages/review_page.dart';
import 'package:mobile_store/services/product_data.dart';
import 'package:mobile_store/widgets/app_text.dart';
import 'package:mobile_store/widgets/custom_button_detail.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../pages/cart_page.dart';
import '../../pages/home_page.dart';
import '../../pages/information_page.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int gottenStars = 4;
  int selectedIndex = 0;
  List pages = [const HomePage(), const CartPage(), const InformationPage()];
  int currentIndex = 0;

  void onTap(int index) {
    switch (index) {
      case 0:
        BlocProvider.of<AppCubits>(context).homePage();
        break;
      case 1:
        BlocProvider.of<AppCubits>(context).cartPage();
        break;
      case 2:
        BlocProvider.of<AppCubits>(context).informationPage();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is DetailProductState) {
        return Scaffold(
          appBar: CustomAppBar(
            logged: true,
            title: '',
            context: context,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 177,
                    width: 393,
                    child: Image.network(
                        ProductData.baseUrl + state.product.images![1].name),
                  ),
                  Text(
                    state.product.name!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(state.product.star!.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return index < gottenStars
                              ? const Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(254, 140, 35, 1),
                                  size: 15,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  color: Color.fromRGBO(254, 140, 35, 1),
                                  size: 15,
                                );
                        }),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButtonDetail(text: state.product.memories![0].name),
                      CustomButtonDetail(text: "64 GB"),
                      CustomButtonDetail(text: "256 GB"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButtonDetail(text: state.product.colors![0].name),
                      CustomButtonDetail(text: state.product.colors![1].name),
                      // CustomButtonDetail(text: state.product.colors![2].name),
                    ],
                  ),
                  Text(
                    "${formatNumber(state.product.price!.toInt())} VND",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(239, 33, 33, 1)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(33), // NEW
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ADD TO CART',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    width: 383,
                    height: 340,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF878593), width: 1.0)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text(
                          "SPECIFICATIONS",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 35,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Screen:",
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: 'IPSLCD6.56"HD+',
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Chip:",
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: 'MediaTek Helio G35',
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 135),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Ram:",
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: '4 GB',
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 125),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Capacity:",
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: '128GB',
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Rear camera:",
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: 'Main 13 MP & Secondary 2',
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          margin: const EdgeInsets.only(left: 10, right: 85),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Battery, Charging:",
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: '5000 mAh33 W',
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 33,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)),
                          child: Center(
                            child: AppText(
                              text: "See more detailed configuration",
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 383,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF878593), width: 1.0)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text(
                          "PRODUCT INFORMATION",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Html(
                                  data: state.product.productTechs![0].info)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 350,
                          height: 33,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)),
                          child: Center(
                            child: AppText(
                              text: "See more ",
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 383,
                    height: 330,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF878593), width: 1.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text(
                          "REVIEW OF CUSTOMER BOUGHT THE PRODUCT",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  state.product.reviews![0].user_name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 26,
                                    );
                                  }),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            state.product.reviews![0].comment,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.5)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  state.product.reviews![0].user_name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 26,
                                    );
                                  }),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(state.product.reviews![0].comment),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.5)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  state.product.reviews![0].user_name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 26,
                                    );
                                  }),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            state.product.reviews![0].comment,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.5)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  state.product.reviews![0].user_name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 26,
                                    );
                                  }),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            state.product.reviews![0].comment,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.5)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the Review screen when tapped
                              BlocProvider.of<AppCubits>(context)
                                  .reviewPage(state.product);
                            },
                            child: Container(
                              width: 350,
                              height: 33,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green)),
                              child: Center(
                                child: AppText(
                                  text: "See more ",
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 383,
                    height: 250,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF878593), width: 1.0)),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                          child: Text(
                        "ANOTHER",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Image.asset('assets/img/samsung.jpg'),
                            Image.asset('assets/img/samsung.jpg'),
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        );
      } if (state is ProductReviewState) {
        return ReviewPage();
      }
      else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  String formatNumber(int number) {
    final NumberFormat formatter = NumberFormat('#,##0', 'vi_VN');
    return formatter.format(number);
  }
}