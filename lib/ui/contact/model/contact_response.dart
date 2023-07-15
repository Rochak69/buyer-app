class ContactResponse {
  String? photo;
  String? name;
  String? position;
  String? contact;

  ContactResponse({this.photo, this.name, this.position, this.contact});

  ContactResponse.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    name = json['name'];
    position = json['position'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    data['name'] = name;
    data['position'] = position;
    data['contact'] = contact;
    return data;
  }
}
