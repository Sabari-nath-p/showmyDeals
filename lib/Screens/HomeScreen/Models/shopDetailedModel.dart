class OutletDetailedModel {
  List<Offers>? offers;
  Store? store;
  String? district;
  bool? active;

  OutletDetailedModel({this.offers, this.store, this.district, this.active});

  OutletDetailedModel.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    district = json['district'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    data['district'] = this.district;
    data['active'] = this.active;
    return data;
  }
}

class Offers {
  Thumbnail? thumbnail;
  bool? hasItems;
  bool? hasLink;
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
  String? shopaddress;
  List<GroupMembers>? groupMembers;
  String? logo;
  String? district;
  String? state;
  int? viewCount;
  int? iV;
  List<Items>? items;

  Offers(
      {this.thumbnail,
      this.hasItems,
      this.hasLink,
      this.sId,
      this.id,
      this.name,
      this.from,
      this.to,
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
      this.district,
      this.state,
      this.viewCount,
      this.iV,
      this.items});

  Offers.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    hasItems = json['hasItems'];
    hasLink = json['hasLink'];
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
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    data['hasItems'] = this.hasItems;
    data['hasLink'] = this.hasLink;
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
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
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

class Store {
  Contact? contact;
  Images? images;
  String? sId;
  String? sid;
  String? id;
  String? name;
  String? address;
  String? district;
  String? state;
  bool? isGroup;
  bool? isShop;
  bool? isInGroup;
  bool? active;
  String? storeType;
  int? priority;
  bool? popular;
  int? iV;
  int? latestUpdate;

  Store(
      {this.contact,
      this.images,
      this.sId,
      this.sid,
      this.id,
      this.name,
      this.address,
      this.district,
      this.state,
      this.isGroup,
      this.isShop,
      this.isInGroup,
      this.active,
      this.storeType,
      this.priority,
      this.popular,
      this.iV,
      this.latestUpdate});

  Store.fromJson(Map<String, dynamic> json) {
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    sId = json['_id'];
    sid = json['sid'];
    id = json['id'];
    name = json['name'];
    address = json['address'];
    district = json['district'];
    state = json['state'];
    isGroup = json['isGroup'];
    isShop = json['isShop'];
    isInGroup = json['isInGroup'];
    active = json['active'];
    storeType = json['storeType'];
    priority = json['priority'];
    popular = json['popular'];
    iV = json['__v'];
    latestUpdate = json['latestUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['_id'] = this.sId;
    data['sid'] = this.sid;
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['district'] = this.district;
    data['state'] = this.state;
    data['isGroup'] = this.isGroup;
    data['isShop'] = this.isShop;
    data['isInGroup'] = this.isInGroup;
    data['active'] = this.active;
    data['storeType'] = this.storeType;
    data['priority'] = this.priority;
    data['popular'] = this.popular;
    data['__v'] = this.iV;
    data['latestUpdate'] = this.latestUpdate;
    return data;
  }
}

class Contact {
  String? phone;
  String? googleMap;

  Contact({this.phone, this.googleMap});

  Contact.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    googleMap = json['googleMap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['googleMap'] = this.googleMap;
    return data;
  }
}

class Images {
  Thumbnail? logo;
  Thumbnail? bg;

  Images({this.logo, this.bg});

  Images.fromJson(Map<String, dynamic> json) {
    logo = json['logo'] != null ? new Thumbnail.fromJson(json['logo']) : null;
    bg = json['bg'] != null ? new Thumbnail.fromJson(json['bg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.bg != null) {
      data['bg'] = this.bg!.toJson();
    }
    return data;
  }
}
