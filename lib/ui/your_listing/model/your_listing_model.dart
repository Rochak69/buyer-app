import 'package:buyer_shop/ui/order_history/model/order_history_response.dart';

class YourListingsResponse {
  String? id;
  String? buyerId;
  FishType? fishType;
  num? avgFishWeight;
  num? totalWeight;
  String? deadline;
  String? yieldDate;
  String? fishTypeId;
  List<FarmerRequest>? farmerRequest;

  YourListingsResponse(
      {this.id,
      this.buyerId,
      this.fishType,
      this.avgFishWeight,
      this.totalWeight,
      this.deadline,
      this.yieldDate,
      this.fishTypeId,
      this.farmerRequest});

  YourListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerId = json['buyerId'];

    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    deadline = json['deadline'];
    yieldDate = json['yieldDate'];

    if (json['FarmerRequest'] != null) {
      farmerRequest = <FarmerRequest>[];
      json['FarmerRequest'].forEach((v) {
        farmerRequest!.add(FarmerRequest.fromJson(v));
      });
    }

    fishType =
        json['FishType'] != null ? FishType.fromJson(json['FishType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['buyerId'] = buyerId;
    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['deadline'] = deadline;
    data['yieldDate'] = yieldDate;
    data['fishTypeId'] = fishTypeId;
    if (farmerRequest != null) {
      data['FarmerRequest'] = farmerRequest!.map((v) => v.toJson()).toList();
    }

    if (fishType != null) {
      data['FishType'] = fishType!.toJson();
    }
    return data;
  }
}

class FarmerRequest {
  String? id;

  FarmerRequest({this.id});

  FarmerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
