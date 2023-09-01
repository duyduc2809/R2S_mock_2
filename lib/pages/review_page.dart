import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/fetch_review.dart';
import '../constants/size_config.dart';
import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';
import '../cubit/review_cubit.dart';
import '../cubit/state/review_state.dart';
import '../models/product/product.dart';
import '../models/review.dart';
import '../models/review_input.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/rating_star.dart';
import '../widgets/success_dialog.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  static const String reviewTitle = 'Review of customer bought the product';
  int selectedStars = 0;
  String titleReview = 'REVIEW';
  TextEditingController commentController = TextEditingController();

  final reviewCubit = ReviewCubit(FetchReview());
  late Future<List<Review>> futureListReview;
  late int productID = 2;
  late Product product;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   reviewCubit.getAllReview(pro);
  // }

  void _onStarSelected(int stars) {
    setState(() {
      selectedStars = stars;
    });
  }

  void _submitComment() async {
    final reviewInput = ReviewInput(
      product_id: product.id!,
      comment: commentController.text,
      rating: selectedStars,
      status: true,
    );

    var result = await reviewCubit.createReview(reviewInput);
    if (result == null) {
      Navigator.pop(context);
      reviewCubit.getAllReview(product.id!);

      showDialog(
        context: context,
        builder: (context) => SuccessDialog(),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
    }
    // Future.delayed(Duration(seconds: 5), () {
    //   Navigator.pop(context);
    // });
  }

  Future<void> _showDialog(
      BuildContext context, ReviewInput? reviewInput) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Center(
                child: Text(
                  titleReview,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _onStarSelected(index + 1);
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 30,
                          color: index < selectedStars
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 118,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    ),
                    child: TextFormField(
                      controller: commentController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 9),
                        labelText: 'Comments',
                        labelStyle:
                            TextStyle(color: Colors.green.withOpacity(0.5)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 117, // Set the desired width
                      height: 39, // Set the desired height
                      child: ElevatedButton(
                        onPressed: () {
                          _submitComment();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text('Send',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      width: 117, // Set the desired width
                      height: 39,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context,state) {
        if (state is ProductReviewState) {
          product = state.product;
          reviewCubit.getAllReview(product.id!);

          return Scaffold(
          appBar: CustomAppBar(
            logged: true,
            title: '',
            showUserInfo: true,
            context: context,
            user: AppCubits.userData,
          ),
          body: SizedBox(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 9,
                ),
                Center(
                  child: Text(
                    reviewTitle.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: BlocProvider.value(
                        value: reviewCubit,
                        child: BlocBuilder<ReviewCubit, ReviewState>(
                          builder: (context, state) {
                            if (state is InitialReviewState ||
                                state is LoadingReviewState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is SuccessLoadingReview) {
                              final reviews = state.listReview;
                              return ListView.builder(
                                itemCount: reviews.length,
                                itemBuilder: (context, index) => Card(
                                  child: ListTile(
                                    title: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text('${reviews[index].user_name} '),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            Column(
                                              children: [
                                                StarRating(
                                                    rating: reviews[index].rating),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                            //${reviews[index].rating}
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      reviews[index].comment,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            } else if (state is FailureReviewState) {
                              return Center(
                                child: Text(state.errorMessage),
                              );
                            }
                            return Text(state.toString());
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await _showDialog(context, null);
              reviewCubit.getAllReview(product.id!);
            },
            backgroundColor: Colors.white,
            label: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        );
        } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
