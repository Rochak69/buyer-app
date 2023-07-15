class UserDetailsResponse {
  String? id;
  String? userId;
  String? website;
  String? bussinessEmail;
  String? fullName;
  String? mobileNumber;
  String? citizenshipName;
  String? citizenshipNumber;
  String? citizenshipIssueDistrictId;
  String? streetName;
  String? facebookPage;
  bool? active;
  bool? approved;
  String? districtId;
  String? municipalityId;
  String? wardId;
  String? provinceId;
  String? createdAt;
  String? bussinessName;
  String? bussinessPhone;
  District? district;
  District? province;
  District? municipality;
  Ward? ward;
  Document? document;

  UserDetailsResponse(
      {this.id,
      this.userId,
      this.website,
      this.bussinessEmail,
      this.fullName,
      this.mobileNumber,
      this.citizenshipName,
      this.citizenshipNumber,
      this.citizenshipIssueDistrictId,
      this.streetName,
      this.facebookPage,
      this.active,
      this.approved,
      this.districtId,
      this.municipalityId,
      this.wardId,
      this.provinceId,
      this.createdAt,
      this.bussinessName,
      this.bussinessPhone,
      this.district,
      this.province,
      this.municipality,
      this.ward,
      this.document});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    website = json['website'];
    bussinessEmail = json['bussinessEmail'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
    citizenshipName = json['citizenshipName'];
    citizenshipNumber = json['citizenshipNumber'];
    citizenshipIssueDistrictId = json['citizenshipIssueDistrictId'];
    streetName = json['streetName'];
    facebookPage = json['facebookPage'];
    active = json['active'];
    approved = json['approved'];
    districtId = json['districtId'];
    municipalityId = json['municipalityId'];
    wardId = json['wardId'];
    provinceId = json['provinceId'];
    createdAt = json['createdAt'];
    bussinessName = json['bussinessName'];
    bussinessPhone = json['bussinessPhone'];
    district = json['district'] != null
        ? District.fromJson(json['district'])
        : null;
    province = json['Province'] != null
        ? District.fromJson(json['Province'])
        : null;
    municipality = json['municipality'] != null
        ? District.fromJson(json['municipality'])
        : null;
    ward = json['Ward'] != null ? Ward.fromJson(json['Ward']) : null;
    document = json['Document'] != null
        ? Document.fromJson(json['Document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['website'] = website;
    data['bussinessEmail'] = bussinessEmail;
    data['fullName'] = fullName;
    data['mobileNumber'] = mobileNumber;
    data['citizenshipName'] = citizenshipName;
    data['citizenshipNumber'] = citizenshipNumber;
    data['citizenshipIssueDistrictId'] = citizenshipIssueDistrictId;
    data['streetName'] = streetName;
    data['facebookPage'] = facebookPage;
    data['active'] = active;
    data['approved'] = approved;
    data['districtId'] = districtId;
    data['municipalityId'] = municipalityId;
    data['wardId'] = wardId;
    data['provinceId'] = provinceId;
    data['createdAt'] = createdAt;
    data['bussinessName'] = bussinessName;
    data['bussinessPhone'] = bussinessPhone;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (province != null) {
      data['Province'] = province!.toJson();
    }
    if (municipality != null) {
      data['municipality'] = municipality!.toJson();
    }
    if (ward != null) {
      data['Ward'] = ward!.toJson();
    }
    if (document != null) {
      data['Document'] = document!.toJson();
    }
    return data;
  }
}

class District {
  String? englishName;
  String? nepaliName;

  District({this.englishName, this.nepaliName});

  District.fromJson(Map<String, dynamic> json) {
    englishName = json['englishName'];
    nepaliName = json['nepaliName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['englishName'] = englishName;
    data['nepaliName'] = nepaliName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['englishNumber'] = englishNumber;
    data['nepaliNumber'] = nepaliNumber;
    return data;
  }
}

class Document {
  String? idenfication;
  String? registration;
  String? profilePicture;
  String? citizenship;

  Document(
      {this.idenfication,
      this.registration,
      this.profilePicture,
      this.citizenship});

  Document.fromJson(Map<String, dynamic> json) {
    idenfication = json['idenfication'];
    registration = json['registration'];
    profilePicture = json['profilePicture'];
    citizenship = json['citizenship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idenfication'] = idenfication;
    data['registration'] = registration;
    data['profilePicture'] = profilePicture;
    data['citizenship'] = citizenship;
    return data;
  }
}
