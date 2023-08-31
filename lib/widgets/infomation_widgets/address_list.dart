import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/adress/address_cubit.dart';
import 'package:mobile_store/cubit/adress/address_state.dart';
import 'package:mobile_store/models/address.dart';
import 'package:mobile_store/services/address_data_service.dart';
import 'package:mobile_store/services/address_data_repo.dart';
import 'package:mobile_store/constants/title_text.dart';
import 'package:mobile_store/services/user_infor_data.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  final addressCubit = AddressCubit(AddressRepository());
  AddressDataRepository addressDataRepository = AddressDataRepository();
  final UserRepository _userRepository = UserRepository();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<bool>? _data;

  @override
  void initState() {
    super.initState();
    addressCubit.getAllAddresses();
    _data = addressDataRepository.setData();
  }

  void typeValidate() {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("You have to chose the type of your address"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"))
          ],
        );
      },
    );
  }

  void showAddressFormDialog({Address? address}) {
    String? provinceSelected;
    String? districtSelected;
    String? wardSelected;
    TextEditingController? detailsAddressController = TextEditingController();
    String? detailAddress = "";
    int isChosenType = 0;
    Color selectedColor = Colors.orange;
    Color defaultColor = Colors.white;
    bool isChecked = false;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return FutureBuilder(
            future: _data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (address == null) {
                  provinceSelected = addressDataRepository.provinceList[0];
                  districtSelected =
                      addressDataRepository.districts[provinceSelected]![0];
                  wardSelected =
                      addressDataRepository.wards[districtSelected]![0];
                } else {
                  List<String> dataLocation = address.location!.split(",");
                  provinceSelected = dataLocation[0].trim();
                  districtSelected = dataLocation[1].trim();
                  wardSelected = dataLocation[2].trim();
                  if (dataLocation.length > 3) {
                    detailAddress = dataLocation[3].trim();
                  }
                }
                return SingleChildScrollView(
                  child: Dialog(child: StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 3, color: Colors.grey.shade400),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 530,
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                      width: 3, color: Colors.grey.shade400),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: TitleText(
                                text: "Delivery Address",
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Flexible(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              isChosenType = 1;
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: isChosenType == 1
                                                  ? selectedColor
                                                  : defaultColor,
                                              border: Border.all(
                                                  color: Colors.orange)),
                                          child: const Row(
                                            children: [
                                              Icon(Icons.home),
                                              Spacer(),
                                              Text(
                                                "HOME",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isChosenType = 2;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: isChosenType == 2
                                                  ? selectedColor
                                                  : defaultColor,
                                              border: Border.all(
                                                  color: Colors.orange)),
                                          child: const Row(
                                            children: [
                                              Icon(Icons.work),
                                              Spacer(),
                                              Text(
                                                "OFFICE",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            height: 60,
                                            child: DropdownButtonFormField<
                                                    String>(
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.green,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  hintStyle: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.green),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                                value: provinceSelected,
                                                items: addressDataRepository
                                                    .provinceList
                                                    .map((e) =>
                                                        DropdownMenuItem<
                                                                String>(
                                                            value: e,
                                                            child: Text(
                                                              e,
                                                              overflow:
                                                                  TextOverflow
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
                                                        addressDataRepository
                                                                .wards[
                                                            districtSelected]![0];
                                                  });
                                                })),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                            height: 60,
                                            width: double.maxFinite,
                                            child: DropdownButtonFormField<
                                                    String>(
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.green,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                                value: districtSelected,
                                                items: addressDataRepository
                                                    .districts[
                                                        provinceSelected]!
                                                    .map((e) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: e,
                                                          child: Text(
                                                            e,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ))
                                                    .toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    districtSelected = value;
                                                    wardSelected =
                                                        addressDataRepository
                                                                .wards[
                                                            districtSelected]![0];
                                                  });
                                                })),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                            height: 60,
                                            width: double.maxFinite,
                                            child: DropdownButtonFormField<
                                                    String>(
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.green,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  hintStyle: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.green),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                                value: wardSelected,
                                                items: addressDataRepository
                                                    .wards[districtSelected]!
                                                    .map((e) =>
                                                        DropdownMenuItem<
                                                                String>(
                                                            value: e,
                                                            child: Text(
                                                              e,
                                                              overflow:
                                                                  TextOverflow
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
                                          onTapOutside: (event) {
                                            FocusScope.of(context)
                                                .requestFocus(new FocusNode());
                                          },
                                          controller: detailsAddressController,
                                          decoration: const InputDecoration(
                                              hintText: "Details",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                          onChanged: (value) {
                                            detailsAddressController
                                                .addListener(() {
                                              detailAddress = value;
                                            });
                                          },
                                          onEditingComplete: () {
                                            detailsAddressController.text =
                                                detailAddress!;
                                          },
                                        ),
                                        CheckboxListTile(
                                            title: const Text(
                                                "Set default address"),
                                            value: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            }),
                                        ButtonBar(
                                          alignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  String userId =
                                                      await _userRepository
                                                          .getIdUser();
                                                  Map<String, dynamic> user =
                                                      await _userRepository
                                                          .getUserById(userId);
                                                  String location =
                                                      "${provinceSelected!}, ${districtSelected!}, ${wardSelected!}${detailsAddressController.text.isNotEmpty ? ", ${detailsAddressController.text}" : ""}";

                                                  String type = "";
                                                  switch (isChosenType) {
                                                    case 1:
                                                      {
                                                        type = "HOME";
                                                      }
                                                      break;
                                                    case 2:
                                                      {
                                                        type = "OFFICE";
                                                      }
                                                      break;
                                                  }

                                                  if (isChosenType == 0) {
                                                    typeValidate();
                                                    return;
                                                  }

                                                  if (address == null) {
                                                    Address newAddress =
                                                        Address(
                                                            nameReceiver: user[
                                                                "fullName"],
                                                            location: location,
                                                            defaults: isChecked,
                                                            type: type,
                                                            phoneReceiver:
                                                                "012345678");

                                                    addressCubit.createAddress(
                                                        newAddress);
                                                  } else {
                                                    address.setLocation =
                                                        location;
                                                    address.setDefaults =
                                                        isChecked;

                                                    addressCubit
                                                        .updateAddress(address);
                                                  }
                                                  if (!mounted) {
                                                    return;
                                                  }
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(address != null
                                                    ? "Update"
                                                    : "Save")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xffcf6767)),
                                                child: Text("Close")),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    },
                  )),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        });
  }

  Widget statusWidget(String description) {
    Color color = Colors.white;
    switch (description.toLowerCase()) {
      case "defaults":
        {
          color = Colors.green;
        }
        break;
      case "HOME":
      case "OFFICE":
        {
          color = Colors.red;
        }
        break;
      default:
        {}
    }

    return Container(
      alignment: Alignment.center,
      height: 22,
      width: 69,
      decoration: BoxDecoration(
          border: Border.all(color: color),
          color: description.isEmpty ? Colors.white : Colors.grey[200]),
      child: Text(
        description,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        height: 256,
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
                                      color: Colors.grey,
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
                                          border:
                                              Border.all(color: Colors.orange),
                                          color: Colors.grey[200]),
                                      child: const Text(
                                        "Home",
                                        style: TextStyle(
                                          color: Colors.orange,
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
                                  onPressed: () {
                                    showAddressFormDialog(
                                        address: addressList[index]);
                                  },
                                  icon: Image.asset(
                                    'assets/img/edit (3) 2.png',
                                    width: 24,
                                    height: 24,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    addressCubit.deleteAddress(
                                        "${addressList[index].id}");
                                  },
                                  icon: Image.asset(
                                    'assets/img/delete.png',
                                    width: 24,
                                    height: 24,
                                  )),
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
