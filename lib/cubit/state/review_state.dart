import 'package:mobile_store/models/address.dart';

import '../../models/review.dart';

abstract class ReviewState {}

class InitialReviewState extends ReviewState {}

class LoadingReviewState extends ReviewState {}

class FailureReviewState extends ReviewState {
  final String errorMessage;
  FailureReviewState(this.errorMessage);
}

class SuccessLoadingReview extends ReviewState {
  final List<Review> listReview;
  SuccessLoadingReview(this.listReview);
}

class SuccessAddReview extends ReviewState {

  SuccessAddReview();
}

class SuccessDeleteReview extends ReviewState {}

class SuccessUpdateReview extends ReviewState {}
