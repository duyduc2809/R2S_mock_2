import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/models/api_user.dart';
import 'package:mobile_store/services/hive_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/services/user_data_services.dart';
import 'package:mobile_store/widgets/auth_widgets/custom_dialog.dart';

import '../../models/user.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  User user = AppCubits.userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      margin: const EdgeInsets.symmetric(vertical: 9),
      width: double.maxFinite,
      height: 190,
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
              const SizedBox(width: 30),
              IconButton(
                onPressed: () {
                  CustomDialog.displayDialog(
                      height: 310,
                      context: context,
                      title: 'Edit Information',
                      content:
                          CustomDialog.editInformation(context, mounted, user));
                },
                icon: Image.asset(
                  'assets/img/edit (3) 2.png',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/img/phone.png',
                width: 20,
                height: 20,
              )),
              const SizedBox(
                width: 2,
              ),
              Text(user.phoneNumber ?? "null")
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Image.asset(
                    'assets/img/image 42.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(user.fullName!)
                ]),
                const SizedBox(
                  height: 6,
                ),
                Row(children: [
                  Image.asset(
                    'assets/img/calender.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text('user.birthDay!'),
                ]),
              ]),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/img/gender.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(user.gender == 1 ? 'male' : 'female')
                  ]),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(children: [
                    Image.asset(
                      'assets/img/mail.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(user.email!)
                  ])
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.blue[400]),
            child: const Text(
              "Change password",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            onPressed: () {
              CustomDialog.displayDialog(
                  height: 230,
                  context: context,
                  title: 'CHANGE PASSWORD',
                  content: CustomDialog.changePassword(context, mounted));
            },
          )
        ],
      ),
    );
  }
}
