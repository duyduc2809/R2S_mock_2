import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
      width: 375,
      height: 155,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "INFORMATION",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 30,
                child: Image.asset(
                  'assets/img/edit (3) 2.png',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          inforRow(context, icon: Icons.edit, text: "0941893338"),
          Row(
            children: [
              inforRow(context, icon: Icons.person, text: "Tran Ky Anh"),
              const SizedBox(
                width: 100,
              ),
              inforRow(context, icon: Icons.male, text: "male")
            ],
          ),
          Row(
            children: [
              inforRow(context, icon: Icons.calendar_month, text: "28/09/2001"),
              const SizedBox(
                width: 100,
              ),
              inforRow(context, icon: Icons.email, text: "kyanh@gmail.com")
            ],
          ),
          ButtonTheme(
              height: 20,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue[400]),
                child: const Text(
                  "Change password",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                onPressed: () {},
              ))
        ],
      ),
    );
  }

  Row inforRow(BuildContext context,
      {required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
