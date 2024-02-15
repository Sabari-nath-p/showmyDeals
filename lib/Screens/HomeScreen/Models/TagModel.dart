class TagModel {
  String? name;
  String? tag;

  TagModel({this.name, this.tag});

  TagModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tag'] = this.tag;
    return data;
  }
}
