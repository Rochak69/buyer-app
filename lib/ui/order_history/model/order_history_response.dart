class OrderHistoryResponse {
  String? id;
  String? farmerSupplyId;
  String? buyerId;
  num? requestWeight;
  bool? isApproved;
  String? phoneNumber;
  String? createdAt;
  bool? completed;
  bool? cancelled;
  FarmerSupply? farmerSupply;

  OrderHistoryResponse(
      {this.id,
      this.farmerSupplyId,
      this.buyerId,
      this.requestWeight,
      this.isApproved,
      this.phoneNumber,
      this.createdAt,
      this.completed,
      this.cancelled,
      this.farmerSupply});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerSupplyId = json['farmerSupplyId'];
    buyerId = json['buyerId'];
    requestWeight = json['requestWeight'];
    isApproved = json['isApproved'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    completed = json['completed'];
    cancelled = json['cancelled'];
    farmerSupply = json['farmerSupply'] != null
        ? FarmerSupply.fromJson(json['farmerSupply'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['farmerSupplyId'] = farmerSupplyId;
    data['buyerId'] = buyerId;
    data['requestWeight'] = requestWeight;
    data['isApproved'] = isApproved;
    data['phoneNumber'] = phoneNumber;
    data['createdAt'] = createdAt;
    data['completed'] = completed;
    data['cancelled'] = cancelled;
    if (farmerSupply != null) {
      data['farmerSupply'] = farmerSupply!.toJson();
    }
    return data;
  }
}

class FarmerSupply {
  String? id;
  String? farmerId;
  num? avgFishWeight;
  num? totalWeight;
  String? yieldDate;
  String? fishTypeId;
  bool? fulfill;
  String? createdAt;
  FishType? fishType;
  Farmer? farmer;

  FarmerSupply(
      {this.id,
      this.farmerId,
      this.avgFishWeight,
      this.totalWeight,
      this.yieldDate,
      this.fishTypeId,
      this.fulfill,
      this.createdAt,
      this.fishType,
      this.farmer});

  FarmerSupply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId = json['farmerId'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
    fulfill = json['fulfill'];
    createdAt = json['createdAt'];
    fishType =
        json['FishType'] != null ? FishType.fromJson(json['FishType']) : null;
    farmer = json['farmer'] != null ? Farmer.fromJson(json['farmer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['farmerId'] = farmerId;
    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['yieldDate'] = yieldDate;
    data['fishTypeId'] = fishTypeId;
    data['fulfill'] = fulfill;
    data['createdAt'] = createdAt;
    if (fishType != null) {
      data['FishType'] = fishType!.toJson();
    }
    if (farmer != null) {
      data['farmer'] = farmer!.toJson();
    }
    return data;
  }
}

class FishType {
  String? name;

  FishType({this.name});

  FishType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Farmer {
  String? id;
  String? userId;
  String? fullName;
  String? farmName;
  String? mobileNumber;
  String? citizenshipName;
  String? citizenshipNumber;
  String? citizenshipIssueDistrictId;
  String? streetName;
  String? email;
  String? facebookPage;
  int? pondSize;
  bool? active;
  bool? approved;
  String? districtId;
  String? municipalityId;
  String? wardId;
  String? provinceId;
  String? createdAt;
  User? user;

  Farmer(
      {this.id,
      this.userId,
      this.fullName,
      this.farmName,
      this.mobileNumber,
      this.citizenshipName,
      this.citizenshipNumber,
      this.citizenshipIssueDistrictId,
      this.streetName,
      this.email,
      this.facebookPage,
      this.pondSize,
      this.active,
      this.approved,
      this.districtId,
      this.municipalityId,
      this.wardId,
      this.provinceId,
      this.createdAt,
      this.user});

  Farmer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    fullName = json['fullName'];
    farmName = json['farmName'];
    mobileNumber = json['mobileNumber'];
    citizenshipName = json['citizenshipName'];
    citizenshipNumber = json['citizenshipNumber'];
    citizenshipIssueDistrictId = json['citizenshipIssueDistrictId'];
    streetName = json['streetName'];
    email = json['email'];
    facebookPage = json['facebookPage'];
    pondSize = json['pondSize'];
    active = json['active'];
    approved = json['approved'];
    districtId = json['districtId'];
    municipalityId = json['municipalityId'];
    wardId = json['wardId'];
    provinceId = json['provinceId'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['farmName'] = farmName;
    data['mobileNumber'] = mobileNumber;
    data['citizenshipName'] = citizenshipName;
    data['citizenshipNumber'] = citizenshipNumber;
    data['citizenshipIssueDistrictId'] = citizenshipIssueDistrictId;
    data['streetName'] = streetName;
    data['email'] = email;
    data['facebookPage'] = facebookPage;
    data['pondSize'] = pondSize;
    data['active'] = active;
    data['approved'] = approved;
    data['districtId'] = districtId;
    data['municipalityId'] = municipalityId;
    data['wardId'] = wardId;
    data['provinceId'] = provinceId;
    data['createdAt'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? phoneNumber;

  User({this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
