import 'package:flutter/material.dart';
import 'package:mobile_store/constants/size_config.dart';
import 'package:mobile_store/widgets/information_tab.dart';
import 'package:mobile_store/widgets/order_tab.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/promotion_tab.dart';
import 'package:mobile_store/cubit/app_cubits.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage>
    with TickerProviderStateMixin {
  List itemsImagesInformation = [
    'information_img.png',
    'shopping_bag_img.png',
    'promotion_img.png'
  ];

  List itemsTextInformation = ['Information', 'Order', 'Promotion'];

  List tabPages = [
    InformationTab(),
    OrderTab(),
    PromotionTab(),
  ];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Color(0xFFE0EAEB),
        // appBar: AppBar(title: const Text('Mobile Store'),),
        appBar: CustomAppBar(
          logged: true,
          title: '',
          showUserInfo: true,
          context: context,
          user: AppCubits.userData,
        ),
        body: Container(
          margin: const EdgeInsets.all(9),
          width: double.maxFinite,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 84,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentTab = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin:
                            const EdgeInsets.only(top: 6, bottom: 6, left: 6),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: double.maxFinite,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/img/' + itemsImagesInformation[index]),
                            Text(itemsTextInformation[index])
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Container(
                  height: 84,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      tabPages[currentTab],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
