import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 25),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),),
                height: 100,
                child: Image.asset('assets/img/samsung.jpg'),
              ),
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sam Sung",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Text.rich(TextSpan(
                          text: "Quannity: ",
                          style: TextStyle(fontStyle: FontStyle.italic),
                          children: <InlineSpan>[
                            TextSpan(text: "+ "),
                            TextSpan(text: "1 "),
                            TextSpan(
                              text: "-",
                            ),
                          ])),
                    ),
                    Text(
                      "1099 USD",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)),
        ),
      ],
    ));
  }
}
