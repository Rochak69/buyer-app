import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/district_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/municipality_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/woda_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/repository/fish_farmer_detail_api_client.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class FishFarmerDetailBloc
    extends Bloc<FishFarmerDetailEvent, FishFarmerDetailState> {
  FishFarmerDetailApiClient apiClient;
  FishFarmerDetailBloc(this.apiClient) : super(const FishFarmerDetailState()) {
    on<PostBuyerDetailsEvent>(_postDetails);
    on<GetProvince>(_getProvince);
    on<GetDistrict>(_getDistrict);
    on<GetMunicipality>(_getMunicipality);
    on<GetWoda>(_getWoda);
  }

  FutureOr<void> _postDetails(
      PostBuyerDetailsEvent event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.postdetails(
          bussinessEmail: 'test@test.com',
          bussinessName: 'testetstes',
          bussinessPhone: '9860304444',
          citizenshipIssueDistrictId: event.citizenshipIssueDistrict,
          citizenshipName: event.citizenName,
          citizenshipNumber: event.citizenNumber,
          fullName: event.farmersName,
          phone: '9860302222',
          userId: event.userId,
          district: event.district,
          pradesh: event.pradesh,
          pondSize: event.pondSize,
          woda: event.woda,
          organizationName: event.organizationName,
          profilePic: event.profilePicture!,
          identification: event.identification!,
          registerPic: event.registerPic!,
          municiplaity: event.nagarpalika);
      result as ApiResponse;
      emit(state.copyWith(theStates: TheStates.success, isPosted: true));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
      } catch (e) {
        displayToastMessage(e.toString());
      }
    }
  }

  FutureOr<void> _getProvince(
      GetProvince event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.getProvince();

      emit(state.copyWith(
          theStates: TheStates.success, provinceResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
      } catch (e) {
        displayToastMessage(e.toString());
      }
    }
  }

  FutureOr<void> _getDistrict(
      GetDistrict event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.getDistrict(provinceId: event.provinceId)
          as ApiResponseForList<DistrictResponse>;
      if (event.provinceId == null) {
        emit(state.copyWith(
            theStates: TheStates.success, allDistrictResponse: result.data));
      } else {
        emit(state.copyWith(
            theStates: TheStates.success, districtResponse: result.data));
      }
    } catch (e) {
      try {
        e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
      } catch (e) {
        displayToastMessage(e.toString());
      }
    }
  }

  FutureOr<void> _getMunicipality(
      GetMunicipality event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result =
          await apiClient.getMunicipality(districtId: event.districtId)
              as ApiResponseForList<MunicipalityResponse>;

      emit(state.copyWith(
          theStates: TheStates.success, municipalityResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
      } catch (e) {
        displayToastMessage(e.toString());
      }
    }
  }

  FutureOr<void> _getWoda(
      GetWoda event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result =
          await apiClient.getWoda(municipalityId: event.municipalityId)
              as ApiResponseForList<WodaResponse>;

      emit(state.copyWith(
          theStates: TheStates.success, wodaResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
      } catch (e) {
        displayToastMessage(e.toString());
      }
    }
  }
}
