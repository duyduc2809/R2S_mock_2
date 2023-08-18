import 'package:flutter/material.dart';
import 'package:mobile_store/widget/app_text.dart';
import 'package:mobile_store/widget/custom_button_detail.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int gottenStars = 4;
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, logged: false),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 177,
                width: 393,
                child: Image.asset('assets/img/imgDetail.png'),
              ),
              const Text(
                "OPPO A57 128GB",
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  const Text("4.1"),
                  const SizedBox(
                    width: 5,
                  ),
                  Wrap(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButtonDetail(text: "64 GB"),
                  CustomButtonDetail(text: "64 GB"),
                  CustomButtonDetail(text: "64 GB"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButtonDetail(text: "Blue"),
                  CustomButtonDetail(text: "Black"),
                  CustomButtonDetail(text: "Red"),
                ],
              ),
              const Text(
                "475 USD",
                style: TextStyle(
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
                  'BUY NOW',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                width: 383,
                height: 340,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF878593), width: 1.0)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      "SPECIFICATIONS",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
                        padding: const EdgeInsets.only(left: 10, right: 135),
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
                        padding: const EdgeInsets.only(left: 10, right: 125),
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
                    border:
                        Border.all(color: const Color(0xFF878593), width: 1.0)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      "PRODUCT INFORMATION",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OPPO has added to the low-cost OPPO A line up a new device called OPPO A57 128GB. "
                        "Unlike the previously launched A57 5G model, the new A-series phone has an HD+ screen,"
                        "a 13 MP main camera and a 5000mAh battery",
                        textAlign: TextAlign.justify,
                      ),
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 383,
                height: 170,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF878593), width: 1.0)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      "REVIEW OF CUSTOMER BOUGHT THE PRODUCT",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    )),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          const Text(
                            "Arain",
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
                      )
                    ),
                    const Text("This is amazing, it have nice camera!"),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
