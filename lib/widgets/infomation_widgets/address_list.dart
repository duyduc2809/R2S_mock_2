import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/address_cubit.dart';
import 'package:mobile_store/cubit/state/address_state.dart';
import 'package:mobile_store/models/address.dart';
import 'package:mobile_store/services/address_data_service.dart';
import 'package:mobile_store/services/address_data_repo.dart';
import 'package:mobile_store/constants/title_text.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  final addressCubit = AddressCubit(AddressRepository());
  AddressDataRepository addressDataRepository = AddressDataRepository();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Address _newAddress;

  @override
  void initState() {
    super.initState();
    addressCubit.getAllAddresses();
    addressDataRepository.setData();
  }

  void _onSubmitForm(Address address) {
    if (_formKey.currentState!.validate()) {
    } else {
      print("Not Done Form Yet");
    }
  }

  void showAddressFormDialog({int? id}) {
    String? provinceSelected = addressDataRepository.provinceList[0];
    String? districtSelected =
        addressDataRepository.districts[provinceSelected]![0];
    String? wardSelected = addressDataRepository.wards[districtSelected]![0];

    bool isChecked = false;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 515,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      width: double.maxFinite,
                      child: TitleText(
                        text: "Delivery Address",
                        size: 25,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border:
                              Border.all(width: 3, color: Colors.grey.shade400),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 30,
                                width: 75,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.home),
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 75,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.work),
                                    Text(
                                      "Work",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 60,
                                      child: DropdownButtonFormField<String>(
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.green,
                                          ),
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green),
                                            border: OutlineInputBorder(),
                                          ),
                                          value: provinceSelected,
                                          items: addressDataRepository
                                              .provinceList
                                              .map((e) =>
                                                  DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(
                                                        e,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              provinceSelected = value;
                                              districtSelected =
                                                  addressDataRepository
                                                          .districts[
                                                      provinceSelected]![0];
                                              wardSelected =
                                                  addressDataRepository.wards[
                                                      districtSelected]![0];
                                            });
                                          })),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      height: 60,
                                      width: double.maxFinite,
                                      child: DropdownButtonFormField<String>(
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.green,
                                          ),
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green),
                                            border: OutlineInputBorder(),
                                          ),
                                          value: districtSelected,
                                          items: addressDataRepository
                                              .districts[provinceSelected]!
                                              .map((e) =>
                                                  DropdownMenuItem<String>(
                                                    value: e,
                                                    child: Text(
                                                      e,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "RobotoSlap"),
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              districtSelected = value;
                                              wardSelected =
                                                  addressDataRepository.wards[
                                                      districtSelected]![0];
                                            });
                                          })),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      height: 60,
                                      width: double.maxFinite,
                                      child: DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green),
                                            border: OutlineInputBorder(),
                                          ),
                                          value: wardSelected,
                                          items: addressDataRepository
                                              .wards[districtSelected]!
                                              .map((e) =>
                                                  DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(
                                                        e,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              wardSelected = value;
                                            });
                                          })),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Details",
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Need fill";
                                      }
                                      return null;
                                    },
                                  ),
                                  CheckboxListTile(
                                      title: Text("Set default address"),
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(
                                          () => isChecked = value!,
                                        );
                                      }),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            String location =
                                                "${provinceSelected!}, ${districtSelected!}, ${wardSelected!}";
                                          },
                                          child: Text("Save")),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Close")),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ))
                  ],
                ),
              );
            },
          ));
        });
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
              onPressed: () {
                showAddressFormDialog();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Add"),
            )
          ],
        ));
  }
}
