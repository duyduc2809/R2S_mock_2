import 'package:flutter/material.dart';
import 'package:mobile_store/constants/fetch_promotion.dart';
import 'package:mobile_store/constants/size_config.dart';
import '../models/promotion.dart';

class PromotionTab extends StatefulWidget {
  const PromotionTab({super.key});

  @override
  State<PromotionTab> createState() => _PromotionTabState();
}

class _PromotionTabState extends State<PromotionTab> {
  late Future<List<Promotion>> futureListPromotion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureListPromotion = FetchPromotion().getAllPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 9.0),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: FutureBuilder(
          future: futureListPromotion,
          builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Retrieve Failed${snapshot.error}");
          } else if (snapshot.hasData) {
            final List<Promotion> promotions = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: promotions.length,
                itemBuilder: (context, index) {
                  final Promotion promotion = promotions[index];
                  final DateTime expireDate = DateTime.parse(promotion.expireDateDTO!);
                  final bool isExpired = expireDate.isBefore(DateTime.now());
                  final TextStyle titleTextStyle = TextStyle(
                    color: isExpired ? Colors.black.withOpacity(0.5) : Colors.black,
                  );
                  return ListTile(
                    tileColor: Colors.white,
                    leading: Image.asset('assets/img/promotion_gift.png'),
                    title: Text(
                      '${promotion.discountDTO}% discount for orders ${promotion.maxGetDTO},'
                          ' for customers who bought ${promotion.totalPurchaseDTO}',
                      style: titleTextStyle,
                    ),
                    subtitle: Text(
                      'Exp: ${promotion.expireDateDTO}',
                      style: TextStyle(
                        color: isExpired ? Colors.black.withOpacity(0.5) : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
          },
          ),
        ),
      ),
    );
  }
}
