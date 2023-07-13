// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FishFarmerDetailEvent {}

class PostBuyerDetailsEvent extends FishFarmerDetailEvent {
  String userId;
  String? profilePicture;
  String? registerPic;
  String? identification;
  String? citizenshipPhoto;
  String organizationName;
  String citizenshipIssueDistrict;

  String farmersName;
  String phoneNumber;
  num? pondSize;
  String pradesh;
  String district;
  String nagarpalika;
  String citizenNumber;
  String citizenName;

  int woda;
  String? tole;
  String? email;
  String? facebook;

  String? buisnessEmail;
  String? buisnessName;
  String? buisnessNumber;
  String? number;

  PostBuyerDetailsEvent({
    required this.userId,
    required this.profilePicture,
    required this.registerPic,
    required this.identification,
    this.citizenshipPhoto,
    required this.organizationName,
    required this.citizenshipIssueDistrict,
    required this.farmersName,
    required this.phoneNumber,
    this.pondSize,
    required this.pradesh,
    required this.district,
    required this.nagarpalika,
    required this.citizenNumber,
    required this.citizenName,
    required this.woda,
    this.tole,
    this.email,
    this.facebook,
    this.buisnessEmail,
    this.buisnessName,
    this.buisnessNumber,
    this.number,
  });
}

class GetProvince extends FishFarmerDetailEvent {}

class GetDistrict extends FishFarmerDetailEvent {
  final String? provinceId;

  GetDistrict({required this.provinceId});
}

class GetMunicipality extends FishFarmerDetailEvent {
  final String districtId;

  GetMunicipality({required this.districtId});
}

class GetWoda extends FishFarmerDetailEvent {
  final String municipalityId;

  GetWoda({required this.municipalityId});
}
