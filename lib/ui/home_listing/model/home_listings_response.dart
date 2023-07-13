import 'package:buyer_shop/ui/order_history/model/order_history_response.dart';

class HomeListingsResponse {
  String? id;
  String? farmerId;
  FishType? fishType;
  num? avgFishWeight;
  num? totalWeight;
  String? yieldDate;
  bool? isDisabled;
  bool? expired;
  String? fishTypeId;

  HomeListingsResponse(
      {this.id,
      this.farmerId,
      this.fishType,
      this.avgFishWeight,
      this.expired,
      this.totalWeight,
      this.yieldDate,
      this.isDisabled,
      this.fishTypeId});

  HomeListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId = json['farmerId'];
    isDisabled = json['disabled'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
    expired = json['expired'];
    fishType =
        json['FishType'] != null ? FishType.fromJson(json['FishType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['farmerId'] = farmerId;

    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['yieldDate'] = yieldDate;
    data['disabled'] = isDisabled;
    data['fishTypeId'] = fishTypeId;
    data['expired'] = expired;
    if (fishType != null) {
      data['FishType'] = fishType!.toJson();
    }
    return data;
  }
}
