// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/home_listing/model/home_listings_response.dart';
import 'package:buyer_shop/ui/home_listing/repository/home_listings_api_client.dart';
import 'package:buyer_shop/ui/login/model/user_details_response.dart';

abstract class HomeListingsState {}

class HomeListingsInitial extends HomeListingsState {}

class HomeListingsSuccess extends HomeListingsState {
  final ApiResponseForList<HomeListingsResponse> result;
  final ApiResponseForList<FishResponse> fishes;
  final ApiResponse<UserDetailsResponse> userDetails;
  HomeListingsSuccess({
    required this.result,
    required this.fishes,
    required this.userDetails,
  });
}

class HomeListingsFailed extends HomeListingsState {
  final String errorMessage;

  HomeListingsFailed({required this.errorMessage});
}
