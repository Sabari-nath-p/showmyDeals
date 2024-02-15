class JobModel {
  String? sId;
  String? id;
  List<String>? districts;
  List<String>? state;
  String? thumbnail;
  List<String>? pages;
  String? location;
  bool? isApplyLinkAvailable;
  String? applyLink;
  int? priority;
  int? iV;
  bool? isActive;

  JobModel(
      {this.sId,
      this.id,
      this.districts,
      this.state,
      this.thumbnail,
      this.pages,
      this.location,
      this.isApplyLinkAvailable,
      this.applyLink,
      this.priority,
      this.iV,
      this.isActive});

  JobModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    districts = json['districts'].cast<String>();
    state = json['state'].cast<String>();
    thumbnail = json['thumbnail'];
    pages = json['pages'].cast<String>();
    location = json['location'];
    isApplyLinkAvailable = json['isApplyLinkAvailable'];
    applyLink = json['applyLink'];
    priority = json['priority'];
    iV = json['__v'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['districts'] = this.districts;
    data['state'] = this.state;
    data['thumbnail'] = this.thumbnail;
    data['pages'] = this.pages;
    data['location'] = this.location;
    data['isApplyLinkAvailable'] = this.isApplyLinkAvailable;
    data['applyLink'] = this.applyLink;
    data['priority'] = this.priority;
    data['__v'] = this.iV;
    data['isActive'] = this.isActive;
    return data;
  }
}
