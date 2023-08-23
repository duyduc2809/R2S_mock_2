import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/address_cubit.dart';
import 'package:mobile_store/cubit/state/address_state.dart';
import 'package:mobile_store/models/address.dart';
import 'package:mobile_store/constants/fetch_address.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  final addressCubit = AddressCubit(AddressRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addressCubit.getAllAddresses();
  }

  void showFormDialog({int? id}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 9),
        color: Colors.white,
        width: double.maxFinite,
        height: 167,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ADDRESS",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
                child: BlocProvider(
              create: (BuildContext context) => addressCubit,
              child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                if (state is InitialAddressState ||
                    state is LoadingAddressState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessLoadingAddress) {
                  final addressList = state.addresses;

                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${addressList[index].nameReceiver} | ${addressList[index].phoneReceiver}"),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${addressList[index].location}",
                                  style: const TextStyle(
                                      overflow: TextOverflow.clip),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 22,
                                      width: 69,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          color: Colors.grey[200]),
                                      child: const Text(
                                        "Default",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 22,
                                      width: 69,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          color: Colors.grey[200]),
                                      child: const Text(
                                        "Default",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ))
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: addressList.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  );
                } else if (state is FailureAddressState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return Text(state.toString());
              }),
            )),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Add"),
            )
          ],
        ));
  }
}
