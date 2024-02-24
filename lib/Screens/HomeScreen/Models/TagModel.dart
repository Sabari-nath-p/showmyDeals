class ContentModel {
  bool? success;
  List<TagModel>? tagModel;
  List<StoreTags>? storeTags;
  List<Ads>? ads;

  ContentModel({this.success, this.tagModel, this.storeTags, this.ads});

  ContentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['tags'] != null) {
      tagModel = <TagModel>[];
      json['tags'].forEach((v) {
        tagModel!.add(new TagModel.fromJson(v));
      });
    }
    if (json['storeTags'] != null) {
      storeTags = <StoreTags>[];
      json['storeTags'].forEach((v) {
        storeTags!.add(new StoreTags.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(new Ads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.tagModel != null) {
      data['tags'] = this.tagModel!.map((v) => v.toJson()).toList();
    }
    if (this.storeTags != null) {
      data['storeTags'] = this.storeTags!.map((v) => v.toJson()).toList();
    }
    if (this.ads != null) {
      data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreTags {
  String? name;
  String? tag;

  StoreTags({this.name, this.tag});

  StoreTags.fromJson(Map<String, dynamic> json) {
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

class Ads {
  String? image;
  String? link;
  bool? isLink;

  Ads({this.image, this.link, this.isLink});

  Ads.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json['link'];
    isLink = json['isLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['link'] = this.link;
    data['isLink'] = this.isLink;
    return data;
  }
}
