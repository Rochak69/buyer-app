import 'package:buyer_shop/ui/order_history/model/order_history_response.dart';

class HomeListingsResponse {
  String? id;
  String? farmerId;
  FishType? fishType;
  int? avgFishWeight;
  int? totalWeight;
  String? yieldDate;
  bool? isDisabled;
  String? fishTypeId;

  HomeListingsResponse(
      {this.id,
      this.farmerId,
      this.fishType,
      this.avgFishWeight,
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
    if (fishType != null) {
      data['FishType'] = fishType!.toJson();
    }
    return data;
  }
}
