import 'package:flutter/cupertino.dart';
import 'package:mobile_store/widgets/infomation_widgets/address_list.dart';
import 'package:mobile_store/widgets/infomation_widgets/user_information.dart';

class InformationTab extends StatefulWidget {
  const InformationTab({super.key});

  @override
  State<InformationTab> createState() => _InformationTabState();
}

class _InformationTabState extends State<InformationTab> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [UserInformation(), Expanded(child: AddressList())],
      ),
    );
  }
}
