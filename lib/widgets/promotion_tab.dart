import 'package:flutter/material.dart';
import 'package:mobile_store/constants/fetch_promotion.dart';
import '../models/promotion.dart';
import '../constants/fetch_promotion.dart';

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
    futureListPromotion = FetchPromotion().getAllPromotions(0, 5);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
    future: futureListPromotion,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text("Retrieve Failed${snapshot.error}");
      } else if (snapshot.hasData) {
        final List<Promotion> promotions = snapshot.data!;
        return ListView.builder(
          itemCount: promotions.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Image.asset('assets/img/promotion_gift.png'),
              title: Text('${promotions[index].discountDTO}% '
                  'discount for orders ${promotions[index].maxGetDTO},'
                  'for customers who bought ${promotions[index].totalPurchaseDTO}'),
              subtitle: Text('Exp: ${promotions[index].expireDateDTO}'),
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
