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
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 92,
                  height: 54,
                  child: Image.asset('assets/img/productCardimg.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sam Sung",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
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
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)),
        ),
      ],
    ));
  }
}
