class SpinContentModel {
  bool? success;
  SpinContent? spinContent;

  SpinContentModel({this.success, this.spinContent});

  SpinContentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    spinContent = json['spinContent'] != null
        ? new SpinContent.fromJson(json['spinContent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.spinContent != null) {
      data['spinContent'] = this.spinContent!.toJson();
    }
    return data;
  }
}

class SpinContent {
  String? id;
  List<Items>? items;

  SpinContent({this.id, this.items});

  SpinContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? smallText;
  String? heading;
  String? text;
  String? expiry;
  String? image;

  Items(
      {this.id,
      this.smallText,
      this.heading,
      this.text,
      this.expiry,
      this.image});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    smallText = json['smallText'];
    heading = json['heading'];
    text = json['text'];
    expiry = json['expiry'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['smallText'] = this.smallText;
    data['heading'] = this.heading;
    data['text'] = this.text;
    data['expiry'] = this.expiry;
    data['image'] = this.image;
    return data;
  }
}
