// To parse this JSON data, do
//
//     final resturentModel = resturentModelFromJson(jsonString);

import 'dart:convert';

ResturentModel resturentModelFromJson(String str) =>
    ResturentModel.fromJson(json.decode(str));

String resturentModelToJson(ResturentModel data) => json.encode(data.toJson());

class ResturentModel {
  String message;
  String currentpage;
  int pagelimit;
  int count;
  List<Datum> data;
  bool status;

  ResturentModel({
    required this.message,
    required this.currentpage,
    required this.pagelimit,
    required this.count,
    required this.data,
    required this.status,
  });

  factory ResturentModel.fromJson(Map<String, dynamic> json) => ResturentModel(
        message: json["message"],
        currentpage: json["currentpage"],
        pagelimit: json["pagelimit"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "currentpage": currentpage,
        "pagelimit": pagelimit,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class Datum {
  int id;
  String nameEn;
  String nameAr;
  int parentId;
  bool isFull;
  bool isOpen;
  int maxQueue;
  dynamic longitude;
  dynamic latitude;
  bool isActive;
  DateTime expiredDate;
  DateTime creadteDate;
  int areaId;
  int createdUser;
  dynamic address;
  dynamic maxGroup;
  dynamic openHour;
  dynamic closeHour;
  int accountType;
  String savedTime;
  String logo;
  bool manualOpen;
  bool manualFull;
  String qrCode;
  int orderId;
  double rating;
  dynamic tablesOptions;
  int reviews;
  dynamic phone;
  int? status;
  dynamic insideActive;
  dynamic outsideActive;
  bool? isOpenManual;
  dynamic insideFull;
  dynamic outsideFull;
  dynamic maxInside;
  dynamic maxOutside;
  int qTime;
  bool? userHold;
  int countryId;
  dynamic cancelReasonRequired;
  String realTimeChannel;
  int branchOrderId;
  bool preOrder;
  String conditionsEn;
  String conditionsAr;
  int queueCost;
  bool fastTrackEnabled;
  bool requiredTurnUpgrade;
  int lilouNotificationNumber;
  String lilouNotificationMessageEn;
  String lilouNotificationMessageAr;
  bool allowFullListAccess;
  String lilouCustomMessageEn;
  String lilouCustomMessageAr;
  bool enableQueueTags;
  bool requiredTickets;
  bool onlyWalkIn;
  int vendorCategory;
  bool pickupAvailable;
  bool queueAvailable;
  int serviceCharges;
  int vat;
  int pickupCustomerFees;
  dynamic kioskIsFull;
  dynamic kioskInsideFull;
  dynamic kioskOutsideFull;
  dynamic branchMinQ;
  dynamic insideMinQ;
  dynamic outsideMinQ;
  int branchCount;
  String foodTypeEn;
  String foodTypeAr;

  Datum({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.parentId,
    required this.isFull,
    required this.isOpen,
    required this.maxQueue,
    required this.longitude,
    required this.latitude,
    required this.isActive,
    required this.expiredDate,
    required this.creadteDate,
    required this.areaId,
    required this.createdUser,
    required this.address,
    required this.maxGroup,
    required this.openHour,
    required this.closeHour,
    required this.accountType,
    required this.savedTime,
    required this.logo,
    required this.manualOpen,
    required this.manualFull,
    required this.qrCode,
    required this.orderId,
    required this.rating,
    required this.tablesOptions,
    required this.reviews,
    required this.phone,
    required this.status,
    required this.insideActive,
    required this.outsideActive,
    required this.isOpenManual,
    required this.insideFull,
    required this.outsideFull,
    required this.maxInside,
    required this.maxOutside,
    required this.qTime,
    required this.userHold,
    required this.countryId,
    required this.cancelReasonRequired,
    required this.realTimeChannel,
    required this.branchOrderId,
    required this.preOrder,
    required this.conditionsEn,
    required this.conditionsAr,
    required this.queueCost,
    required this.fastTrackEnabled,
    required this.requiredTurnUpgrade,
    required this.lilouNotificationNumber,
    required this.lilouNotificationMessageEn,
    required this.lilouNotificationMessageAr,
    required this.allowFullListAccess,
    required this.lilouCustomMessageEn,
    required this.lilouCustomMessageAr,
    required this.enableQueueTags,
    required this.requiredTickets,
    required this.onlyWalkIn,
    required this.vendorCategory,
    required this.pickupAvailable,
    required this.queueAvailable,
    required this.serviceCharges,
    required this.vat,
    required this.pickupCustomerFees,
    required this.kioskIsFull,
    required this.kioskInsideFull,
    required this.kioskOutsideFull,
    required this.branchMinQ,
    required this.insideMinQ,
    required this.outsideMinQ,
    required this.branchCount,
    required this.foodTypeEn,
    required this.foodTypeAr,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        parentId: json["parentID"],
        isFull: json["isFull"],
        isOpen: json["isOpen"],
        maxQueue: json["maxQueue"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        isActive: json["isActive"],
        expiredDate: DateTime.parse(json["expiredDate"]),
        creadteDate: DateTime.parse(json["creadteDate"]),
        areaId: json["areaId"],
        createdUser: json["createdUser"],
        address: json["address"],
        maxGroup: json["maxGroup"],
        openHour: json["openHour"],
        closeHour: json["closeHour"],
        accountType: json["accountType"],
        savedTime: json["savedTime"],
        logo: json["logo"],
        manualOpen: json["manualOpen"],
        manualFull: json["manualFull"],
        qrCode: json["qrCode"],
        orderId: json["orderId"],
        rating: json["rating"]?.toDouble(),
        tablesOptions: json["tablesOptions"],
        reviews: json["reviews"],
        phone: json["phone"],
        status: json["status"],
        insideActive: json["insideActive"],
        outsideActive: json["outsideActive"],
        isOpenManual: json["isOpenManual"],
        insideFull: json["insideFull"],
        outsideFull: json["outsideFull"],
        maxInside: json["maxInside"],
        maxOutside: json["maxOutside"],
        qTime: json["qTime"],
        userHold: json["userHold"],
        countryId: json["countryID"],
        cancelReasonRequired: json["cancelReasonRequired"],
        realTimeChannel: json["realTimeChannel"],
        branchOrderId: json["branchOrderID"],
        preOrder: json["preOrder"],
        conditionsEn: json["conditionsEn"],
        conditionsAr: json["conditionsAr"],
        queueCost: json["QueueCost"],
        fastTrackEnabled: json["FastTrackEnabled"],
        requiredTurnUpgrade: json["RequiredTurnUpgrade"],
        lilouNotificationNumber: json["LilouNotificationNumber"],
        lilouNotificationMessageEn: json["LilouNotificationMessageEn"],
        lilouNotificationMessageAr: json["LilouNotificationMessageAr"],
        allowFullListAccess: json["AllowFullListAccess"],
        lilouCustomMessageEn: json["LilouCustomMessageEn"],
        lilouCustomMessageAr: json["LilouCustomMessageAr"],
        enableQueueTags: json["EnableQueueTags"],
        requiredTickets: json["RequiredTickets"],
        onlyWalkIn: json["OnlyWalkIn"],
        vendorCategory: json["VendorCategory"],
        pickupAvailable: json["PickupAvailable"],
        queueAvailable: json["QueueAvailable"],
        serviceCharges: json["ServiceCharges"],
        vat: json["Vat"],
        pickupCustomerFees: json["PickupCustomerFees"],
        kioskIsFull: json["KioskIsFull"],
        kioskInsideFull: json["KioskInsideFull"],
        kioskOutsideFull: json["KioskOutsideFull"],
        branchMinQ: json["BranchMinQ"],
        insideMinQ: json["InsideMinQ"],
        outsideMinQ: json["OutsideMinQ"],
        branchCount: json["branchCount"],
        foodTypeEn: json["foodTypeEN"],
        foodTypeAr: json["foodTypeAr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "parentID": parentId,
        "isFull": isFull,
        "isOpen": isOpen,
        "maxQueue": maxQueue,
        "longitude": longitude,
        "latitude": latitude,
        "isActive": isActive,
        "expiredDate": expiredDate.toIso8601String(),
        "creadteDate": creadteDate.toIso8601String(),
        "areaId": areaId,
        "createdUser": createdUser,
        "address": address,
        "maxGroup": maxGroup,
        "openHour": openHour,
        "closeHour": closeHour,
        "accountType": accountType,
        "savedTime": savedTime,
        "logo": logo,
        "manualOpen": manualOpen,
        "manualFull": manualFull,
        "qrCode": qrCode,
        "orderId": orderId,
        "rating": rating,
        "tablesOptions": tablesOptions,
        "reviews": reviews,
        "phone": phone,
        "status": status,
        "insideActive": insideActive,
        "outsideActive": outsideActive,
        "isOpenManual": isOpenManual,
        "insideFull": insideFull,
        "outsideFull": outsideFull,
        "maxInside": maxInside,
        "maxOutside": maxOutside,
        "qTime": qTime,
        "userHold": userHold,
        "countryID": countryId,
        "cancelReasonRequired": cancelReasonRequired,
        "realTimeChannel": realTimeChannel,
        "branchOrderID": branchOrderId,
        "preOrder": preOrder,
        "conditionsEn": conditionsEn,
        "conditionsAr": conditionsAr,
        "QueueCost": queueCost,
        "FastTrackEnabled": fastTrackEnabled,
        "RequiredTurnUpgrade": requiredTurnUpgrade,
        "LilouNotificationNumber": lilouNotificationNumber,
        "LilouNotificationMessageEn": lilouNotificationMessageEn,
        "LilouNotificationMessageAr": lilouNotificationMessageAr,
        "AllowFullListAccess": allowFullListAccess,
        "LilouCustomMessageEn": lilouCustomMessageEn,
        "LilouCustomMessageAr": lilouCustomMessageAr,
        "EnableQueueTags": enableQueueTags,
        "RequiredTickets": requiredTickets,
        "OnlyWalkIn": onlyWalkIn,
        "VendorCategory": vendorCategory,
        "PickupAvailable": pickupAvailable,
        "QueueAvailable": queueAvailable,
        "ServiceCharges": serviceCharges,
        "Vat": vat,
        "PickupCustomerFees": pickupCustomerFees,
        "KioskIsFull": kioskIsFull,
        "KioskInsideFull": kioskInsideFull,
        "KioskOutsideFull": kioskOutsideFull,
        "BranchMinQ": branchMinQ,
        "InsideMinQ": insideMinQ,
        "OutsideMinQ": outsideMinQ,
        "branchCount": branchCount,
        "foodTypeEN": foodTypeEn,
        "foodTypeAr": foodTypeAr,
      };
}
