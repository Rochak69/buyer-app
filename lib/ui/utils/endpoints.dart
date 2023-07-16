class Endpoints {
  static const String baseUrl = 'http://64.227.154.34:8080/api';
  static const String loginUrl = '/user/login';
  static const String registerUrl = '/user/register';
  static const String otpUrl = '/user/get-otp';
  static const String verifyOtp = '/user/verify-code';
  static const String resetPassword = '/user/reset-password';
  static const String buyerIssue = '/issues/buyer';
  static const String fishType = '/fishtype';
  static const String buyerRequest = '/buyer/request';
  static const String baseFile = 'http://64.227.154.34:8080';
  static const String contact = '/appinfo';

  static const String createSupplyRequest = '/buyerRequest';
  static const String getAllFarmersSupply = '/farmerSupply';
  static const String getMyListings = '/me/listing?type=buyer';
  // static String yourListings(String farmerId) => '/farmerSupply/$farmerId';
  static String deleteMyListing(String id) => '/buyerDemand/$id';
  static String acceptFarmerRequest(String id) => '/farmerRequest/$id';
  static String rejectFarmerRequest(String id) => '/farmerRequest/$id';
  static const String createBuyerDemand = '/buyerDemand';
  static const String getAllFarmerSupply = '/farmerSupply';
  static String getFilteredFarmerSupply(String fishId) =>
      '/farmerSupply?fishType=$fishId';
  static const String getUserDetails = '/me?type=buyer';
  static const String getAllBuyerRequest = '/buyer/request';
  static const String myOrders = '/me/myoder?type=buyer';
  static String completeOrder(String id) => '/me/myoder/confirm/$id?type=buyer';
  static String rejectOrder(String id) => '/me/myoder/reject/$id?type=buyer';
  String getSpecificFarmerSupply(String supplyId) {
    return '/farmerSupply/$supplyId';
  }

  static const String province = '/location/province';
  static const String allDistrict = '/location/district';
  static String getDistrict(String provinceId) =>
      '/location/district/$provinceId';
  static String getMunicipality(String districtId) =>
      '/location/municipality/$districtId';
  static String woda(String municipalityId) => '/location/ward/$municipalityId';
}
