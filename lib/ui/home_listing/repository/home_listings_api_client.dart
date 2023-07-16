import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/home_listing/model/home_listings_response.dart';
import 'package:buyer_shop/ui/login/model/user_details_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeListingApiClient {
  ApiClient? _apiClient;

  HomeListingApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponseForList?> getHomeListings({String? fishId}) async {
    Preferences preferences = Preferences();
    String? token = await preferences.getString(Preference.accessToken);
    if (token == null) {
      displayToastMessage('Token is null',
          backgroundColor: AppColors.textRedColor);
      throw Exception();
    }

    ///or pass object directly to the http post

    var apiResponse = fishId == null
        ? await _apiClient?.httpGetUrl(Endpoints.getAllFarmerSupply, token)
        : await _apiClient?.httpGetUrl(
            Endpoints.getFilteredFarmerSupply(fishId), token);

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Successfully got',
      data: (apiResponse as List<dynamic>)
          .map((data) => HomeListingsResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponse?> sendOffer(
      {required String farmerSupplyId,
      required String phoneNumber,
      required int supplyWeight}) async {
    Preferences preferences = Preferences();
    String? buyerId = await preferences.getString(Preference.buyerId);
    if (buyerId == null) {
      throw Exception();
    }
    Map<String, dynamic> data = {
      "farmerSupplyId": farmerSupplyId,
      "phoneNumber": phoneNumber,
      "buyerId": buyerId,
      "requestWeight": supplyWeight
    };

    var apiResponse =
        await _apiClient?.httpPost(Endpoints.createSupplyRequest, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Successfully got', data: null);

    return response;
  }

  Future<ApiResponse<UserDetailsResponse>> getUserDetails() async {
    Preferences preferences = Preferences();

    String? token = await preferences.getString(Preference.accessToken);

    var apiResponse =
        await _apiClient?.httpGetUrl(Endpoints.getUserDetails, token!);

    ///converting to response
    var registerResponse = ApiResponse<UserDetailsResponse>(
        status: Status.success,
        message: 'Success fully logged in',
        data: UserDetailsResponse.fromJson(apiResponse));

    await preferences.saveString(Preference.buyerId, apiResponse['id']);

    return registerResponse;
  }

  Future<ApiResponseForList?> getFish() async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post

    var apiResponse = await _apiClient?.httpGet(Endpoints.fishType);

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Successfully got',
      data: (apiResponse as List<dynamic>)
          .map((data) => FishResponse.fromJson(data))
          .toList(),
    );

    return response;
  }
}

class FishResponse {
  String? id;
  String? name;
  String? discription;
  String? createdAt;

  FishResponse({this.id, this.name, this.discription, this.createdAt});

  FishResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discription = json['discription'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['discription'] = discription;
    data['createdAt'] = createdAt;
    return data;
  }
}
