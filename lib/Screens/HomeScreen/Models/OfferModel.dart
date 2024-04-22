class OfferModel {
  Thumbnail? thumbnail;
  String? sId;
  String? id;
  String? name;
  String? from;
  String? to;
  bool? ongoing;
  bool? public;
  List<String>? pages;
  int? offerCount;
  List<String>? tags;
  int? priority;
  bool? isShop;
  bool? isGroup;
  List<String>? of;
  String? shopid;
  String? shopname;
  String? linkText;
  String? link;
  String? shopaddress;
  List<GroupMembers>? groupMembers;
  String? logo;
  String? district;
  String? state;
  int? viewCount;
  int? iV;
  bool? hasItems;
  List<Items>? items;
  bool? hasLink;

  OfferModel(
      {this.thumbnail,
      this.sId,
      this.id,
      this.name,
      this.from,
      this.to,
      this.linkText,
      this.ongoing,
      this.public,
      this.pages,
      this.offerCount,
      this.tags,
      this.priority,
      this.isShop,
      this.isGroup,
      this.of,
      this.shopid,
      this.shopname,
      this.shopaddress,
      this.groupMembers,
      this.logo,
      this.link,
      this.district,
      this.state,
      this.viewCount,
      this.iV,
      this.hasItems,
      this.items,
      this.hasLink});

  OfferModel.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    from = json['from'];
    to = json['to'];
    ongoing = json['ongoing'];
    public = json['public'];
    pages = json['pages'].cast<String>();
    offerCount = json['offerCount'];
    tags = json['tags'].cast<String>();
    priority = json['priority'];
    isShop = json['isShop'];
    isGroup = json['isGroup'];
    of = json['of'].cast<String>();
    shopid = json['shopid'];
    shopname = json['shopname'];
    shopaddress = json['shopaddress'];
    linkText = json["linkText"];
    link = json["link"];

    if (json['groupMembers'] != null) {
      groupMembers = <GroupMembers>[];
      json['groupMembers'].forEach((v) {
        groupMembers!.add(new GroupMembers.fromJson(v));
      });
    }
    logo = json['logo'];
    district = json['district'];
    state = json['state'];
    viewCount = json['viewCount'];
    iV = json['__v'];
    hasItems = json['hasItems'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    hasLink = json['hasLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['from'] = this.from;
    data['to'] = this.to;
    data['ongoing'] = this.ongoing;
    data['public'] = this.public;
    data['pages'] = this.pages;
    data['offerCount'] = this.offerCount;
    data['tags'] = this.tags;
    data['priority'] = this.priority;
    data['isShop'] = this.isShop;
    data['isGroup'] = this.isGroup;
    data['of'] = this.of;
    data['shopid'] = this.shopid;
    data['shopname'] = this.shopname;
    data['shopaddress'] = this.shopaddress;
    if (this.groupMembers != null) {
      data['groupMembers'] = this.groupMembers!.map((v) => v.toJson()).toList();
    }
    data['logo'] = this.logo;
    data['district'] = this.district;
    data['state'] = this.state;
    data['viewCount'] = this.viewCount;
    data['__v'] = this.iV;
    data['hasItems'] = this.hasItems;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['hasLink'] = this.hasLink;
    return data;
  }
}

class Thumbnail {
  String? url;
  String? publicId;

  Thumbnail({this.url, this.publicId});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['public_id'] = this.publicId;
    return data;
  }
}

class GroupMembers {
  String? id;
  String? name;
  String? address;
  String? sId;

  GroupMembers({this.id, this.name, this.address, this.sId});

  GroupMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['_id'] = this.sId;
    return data;
  }
}

class Items {
  String? sId;
  String? itemid;
  String? itemname;
  String? itemdesc;
  String? image;

  Items({this.sId, this.itemid, this.itemname, this.itemdesc, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    itemid = json['itemid'];
    itemname = json['itemname'];
    itemdesc = json['itemdesc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['itemid'] = this.itemid;
    data['itemname'] = this.itemname;
    data['itemdesc'] = this.itemdesc;
    data['image'] = this.image;
    return data;
  }
}
