class OrderHistoryResponse {
  num? avgFishWeight;
  String? createdAt;
  num? requestedWeight;
  String? yieldDate;
  String? fishType;
  String? farmerName;
  String? phoneNumber;
  String? municipality;
  String? ward;
  String? streetName;
  String? facebookPage;
  String? website;
  String? id;

  OrderHistoryResponse(
      {this.avgFishWeight,
      this.createdAt,
      this.requestedWeight,
      this.yieldDate,
      this.fishType,
      this.farmerName,
      this.streetName,
      this.id,
      this.facebookPage,
      this.website,
      this.phoneNumber,
      this.municipality,
      this.ward});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    avgFishWeight = json['avgFishWeight'];
    createdAt = json['createdAt'];
    requestedWeight = json['requestedWeight'];
    yieldDate = json['yieldDate'];
    fishType = json['FishType'];
    farmerName = json['farmerName'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
    streetName = json['streetName'];
    website = json['website'];
    facebookPage = json['facebookId'];
    municipality = json['municipality'];
    ward = json['Ward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avgFishWeight'] = this.avgFishWeight;
    data['createdAt'] = this.createdAt;
    data['requestedWeight'] = this.requestedWeight;
    data['yieldDate'] = this.yieldDate;
    data['FishType'] = this.fishType;
    data['farmerName'] = this.farmerName;
    data['phoneNumber'] = this.phoneNumber;
    data['municipality'] = this.municipality;
    data['streetName'] = this.streetName;
    data['Ward'] = this.ward;
    return data;
  }
}

class Municipality {
  String? englishName;
  String? nepaliName;

  Municipality({this.englishName, this.nepaliName});

  Municipality.fromJson(Map<String, dynamic> json) {
    englishName = json['englishName'];
    nepaliName = json['nepaliName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['englishName'] = this.englishName;
    data['nepaliName'] = this.nepaliName;
    return data;
  }
}

class Ward {
  String? englishNumber;
  String? nepaliNumber;

  Ward({this.englishNumber, this.nepaliNumber});

  Ward.fromJson(Map<String, dynamic> json) {
    englishNumber = json['englishNumber'];
    nepaliNumber = json['nepaliNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['englishNumber'] = this.englishNumber;
    data['nepaliNumber'] = this.nepaliNumber;
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
  num? pondSize;
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
