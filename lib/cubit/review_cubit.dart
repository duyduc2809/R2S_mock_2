import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/state/review_state.dart';
import 'package:mobile_store/models/review.dart';
import 'package:mobile_store/models/review_input.dart';
import '../constants/fetch_review.dart';


class ReviewCubit extends Cubit<ReviewState> {
  final FetchReview _reviewRepository;
  ReviewCubit(this._reviewRepository) : super(InitialReviewState());

  Future<void> getAllReview() async {
    emit(LoadingReviewState());
    try {
      var result = await _reviewRepository.getAllReview(1);
      emit(SuccessLoadingReview(result));
    } catch (e) {
      emit(FailureReviewState(e.toString()));
    }
  }

  Future<void> createReview(ReviewInput review) async {
    emit(LoadingReviewState());
    try {
      var result = await _reviewRepository.createReview(review);
      emit(SuccessAddReview(result));
    } catch (e) {
      emit(FailureReviewState(e.toString()));
    }
  }
}
