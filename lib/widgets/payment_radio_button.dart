import 'package:flutter/material.dart';

class PaymentRadioButton extends StatefulWidget {
  const PaymentRadioButton({super.key});

  @override
  State<PaymentRadioButton> createState() => _PaymentRadioButtonState();
}

class _PaymentRadioButtonState extends State<PaymentRadioButton> {
  int? _selectedOption ;

  final List<Map<String, dynamic>> _options = [
    {
      'label': 'Wallet MoMo',
      'image': 'assets/img/momo_img.png',
    },
    {
      'label': 'Pay after receive order',
      'image': 'assets/img/ship_cod_img.png',
    },
    {
      'label': 'Banking',
      'image': 'assets/img/banking_img.png',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _options.map((option) {
        int optionIndex = _options.indexOf(option);
        bool isSelected = _selectedOption == optionIndex;
        return InkWell(
          onTap: () {
            setState(() {
              _selectedOption = optionIndex;
            });
          },
          child: Row(
            children: [
              Radio<bool>(
                value: isSelected,
                groupValue: true,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = optionIndex;
                  });
                },
                activeColor: Colors.green,
              ),
              Image.asset(
                option['image'],
              ),
              const SizedBox(width: 10),
              Text(
                option['label'],
                style:const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

            ],
          ),
        );
      }).toList(),
    );
    // return Column(
    //   children: _options.map((option) {
    //     int optionIndex = _options.indexOf(option);
    //     return RadioListTile(
    //       contentPadding: EdgeInsets.all(0),
    //       title: Row(
    //         children: [
    //           Image.asset(
    //             option['image'],
    //           ),
    //           const SizedBox(width: 10),
    //           Text(option['label']),
    //         ],
    //       ),
    //       value: optionIndex,
    //       groupValue: _selectedOption,
    //       onChanged: (value) {
    //         setState(() {
    //           _selectedOption = value;
    //         });
    //       },
    //       activeColor: Colors.green,
    //       controlAffinity: ListTileControlAffinity.leading,
    //     );
    //   }).toList(),
    // );
  }
}

