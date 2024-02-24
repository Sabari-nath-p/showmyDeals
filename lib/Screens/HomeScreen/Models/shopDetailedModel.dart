import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';

class OutletDetailedModel {
  bool? success;
  List<OfferModel>? activeOffers;
  List<OfferModel>? oldOffers;
  Store? store;
  String? district;
  bool? active;

  OutletDetailedModel(
      {this.success,
      this.activeOffers,
      this.oldOffers,
      this.store,
      this.district,
      this.active});

  OutletDetailedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['activeOffers'] != null) {
      activeOffers = <OfferModel>[];
      json['activeOffers'].forEach((v) {
        activeOffers!.add(new OfferModel.fromJson(v));
      });
    }
    if (json['oldOffers'] != null) {
      oldOffers = <OfferModel>[];
      json['oldOffers'].forEach((v) {
        oldOffers!.add(new OfferModel.fromJson(v));
      });
    }
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    district = json['district'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.activeOffers != null) {
      data['activeOffers'] = this.activeOffers!.map((v) => v.toJson()).toList();
    }
    if (this.oldOffers != null) {
      data['oldOffers'] = this.oldOffers!.map((v) => v.toJson()).toList();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    data['district'] = this.district;
    data['active'] = this.active;
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
