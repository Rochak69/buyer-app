class LoginResponse {
  String? sessionToken;
  String? id;
  String? userName;
  String? phoneNumber;
  bool? isFarmer;
  bool? isBuyer;
  FarmerStatus? farmerStatus;
  FarmerStatus? buyerStatus;

  LoginResponse(
      {this.sessionToken,
      this.id,
      this.userName,
      this.phoneNumber,
      this.isFarmer,
      this.isBuyer,
      this.farmerStatus,
      this.buyerStatus});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    sessionToken = json['session_token'];
    id = json['id'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    isFarmer = json['isFarmer'];
    isBuyer = json['isBuyer'];
    farmerStatus = json['farmerStatus'] != null
        ? FarmerStatus.fromJson(json['farmerStatus'])
        : null;
    buyerStatus = json['buyerStatus'] != null
        ? FarmerStatus.fromJson(json['buyerStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_token'] = sessionToken;
    data['id'] = id;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    data['isFarmer'] = isFarmer;
    data['isBuyer'] = isBuyer;
    if (farmerStatus != null) {
      data['farmerStatus'] = farmerStatus!.toJson();
    }
    if (buyerStatus != null) {
      data['buyerStatus'] = buyerStatus!.toJson();
    }
    return data;
  }
}

class FarmerStatus {
  bool? active;
  bool? approved;

  FarmerStatus({this.active, this.approved});

  FarmerStatus.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    approved = json['approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['approved'] = approved;
    return data;
  }
}
