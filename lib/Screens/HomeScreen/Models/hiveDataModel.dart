import 'package:hive_flutter/hive_flutter.dart';
part 'hiveDataModel.g.dart';

@HiveType(typeId: 0)
class CartDataModel {
  @HiveField(0)
  String? itemName;
  @HiveField(1)
  String? itemID;
  @HiveField(2)
  String? offerID;
  @HiveField(3)
  String? offerName;
  @HiveField(4)
  String? ImageUrl;
  @HiveField(5)
  String? from;
  @HiveField(6)
  String? to;

  CartDataModel(
      {this.ImageUrl,
      this.itemID,
      this.from,
      this.itemName,
      this.offerID,
      this.offerName,
      this.to});
}
