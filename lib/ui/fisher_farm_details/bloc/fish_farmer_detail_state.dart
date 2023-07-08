// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:buyer_shop/ui/fisher_farm_details/model/district_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/municipality_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/province_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/woda_response.dart';

class FishFarmerDetailState extends Equatable {
  final TheStates theStates;
  final String? errorMessage;
  final List<ProvincesResponse>? provinceResponse;
  final List<DistrictResponse>? districtResponse;
  final List<DistrictResponse>? allDistrictResponse;
  final List<MunicipalityResponse>? municipalityResponse;
  final List<WodaResponse>? wodaResponse;
  final bool isPosted;

  const FishFarmerDetailState(
      {this.theStates = TheStates.initial,
      this.errorMessage,
      this.provinceResponse,
      this.districtResponse,
      this.allDistrictResponse,
      this.municipalityResponse,
      this.wodaResponse,
      this.isPosted = false});

  @override
  List<Object?> get props => [
        theStates,
        errorMessage,
        provinceResponse,
        districtResponse,
        municipalityResponse,
        allDistrictResponse,
        wodaResponse,
        isPosted
      ];

  FishFarmerDetailState copyWith(
      {TheStates? theStates,
      String? errorMessage,
      List<ProvincesResponse>? provinceResponse,
      List<DistrictResponse>? districtResponse,
      List<MunicipalityResponse>? municipalityResponse,
      List<WodaResponse>? wodaResponse,
      List<DistrictResponse>? allDistrictResponse,
      bool? isPosted}) {
    return FishFarmerDetailState(
        theStates: theStates ?? this.theStates,
        errorMessage: errorMessage ?? this.errorMessage,
        provinceResponse: provinceResponse ?? this.provinceResponse,
        districtResponse: districtResponse ?? this.districtResponse,
        municipalityResponse: municipalityResponse ?? this.municipalityResponse,
        wodaResponse: wodaResponse ?? this.wodaResponse,
        allDistrictResponse: allDistrictResponse ?? this.allDistrictResponse,
        isPosted: isPosted ?? this.isPosted);
  }
}

enum TheStates {
  success,
  initial,
  failed,
  loading,
}
