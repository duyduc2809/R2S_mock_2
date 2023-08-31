import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_store/models/api_user.dart';
import 'package:mobile_store/services/hive_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/widgets/auth_widgets/custom_dialog.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  String _phone = '';
  String _fullName = '';
  String _birthday = '';
  String _gender = '';
  String _email = '';

  static const urlGetUserByID = 'http://45.117.170.206:60/apis/user/';

  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    final APIUser user = await HiveHelper.loadUserData();
    final url = '$urlGetUserByID${user.idUser}';
    final uri = Uri.parse(url);

    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer ${user.token}'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          //_phone = data['phone'];
          _fullName = data['fullName'];
          //_birthday = data['birthday'];
          //_gender = data['gender'];
          _email = data['email'];
        });
        print('getuser successfully');
      } else {
        print(response.statusCode);
        print(response.body);
        print('get failed');
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 5),
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
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
                  // CustomDialog.displayDialog(
                  //     height: 270,
                  //     context: context,
                  //     title: 'Edit Information',
                  //     content: CustomDialog.editInformation(context, mounted));
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
              Text('unknow')
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Row(children: [
                Image.asset(
                  'assets/img/image 42.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text('$_fullName')
              ]),
              const SizedBox(
                width: 15,
              ),
              Row(children: [
                Image.asset(
                  'assets/img/gender.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text('unknow')
              ])
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Row(children: [
                Image.asset(
                  'assets/img/calender.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text('unknow')
              ]),
              const SizedBox(
                width: 50,
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
                Text('$_email')
              ])
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ButtonTheme(
              height: 20,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue[400]),
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
              ))
        ],
      ),
    );
  }
}
