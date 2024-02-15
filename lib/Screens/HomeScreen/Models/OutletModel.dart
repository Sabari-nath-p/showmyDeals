class OutletModel {
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
  List<GroupMembers>? groupMembers;
  bool? active;
  String? storeType;
  int? priority;
  bool? popular;
  int? latestUpdate;
  int? iV;

  OutletModel(
      {this.images,
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
      this.groupMembers,
      this.active,
      this.storeType,
      this.priority,
      this.popular,
      this.latestUpdate,
      this.iV});

  OutletModel.fromJson(Map<String, dynamic> json) {
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
    if (json['groupMembers'] != null) {
      groupMembers = <GroupMembers>[];
      json['groupMembers'].forEach((v) {
        groupMembers!.add(new GroupMembers.fromJson(v));
      });
    }
    active = json['active'];
    storeType = json['storeType'];
    priority = json['priority'];
    popular = json['popular'];
    latestUpdate = json['latestUpdate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.groupMembers != null) {
      data['groupMembers'] = this.groupMembers!.map((v) => v.toJson()).toList();
    }
    data['active'] = this.active;
    data['storeType'] = this.storeType;
    data['priority'] = this.priority;
    data['popular'] = this.popular;
    data['latestUpdate'] = this.latestUpdate;
    data['__v'] = this.iV;
    return data;
  }
}

class Images {
  Logo? logo;
  Logo? bg;

  Images({this.logo, this.bg});

  Images.fromJson(Map<String, dynamic> json) {
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    bg = json['bg'] != null ? new Logo.fromJson(json['bg']) : null;
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

class Logo {
  String? url;
  String? publicId;

  Logo({this.url, this.publicId});

  Logo.fromJson(Map<String, dynamic> json) {
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
