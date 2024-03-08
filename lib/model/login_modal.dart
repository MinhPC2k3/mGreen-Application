class AccountSuperApp{
  AccountSuperApp._({required this.userName,required this.appID,required this.phoneNumber, required this.userID});
  final String? userName;
  final int? userID;
  final int? appID;
  final String? phoneNumber;

  factory AccountSuperApp.fromJson(Map<String,dynamic> json) =>
      AccountSuperApp._(
        userName: json["UserName"],
        userID: json["UserID"],
        appID: json["AppID"],
        phoneNumber: json["PhoneNumber"]
      );
  Map<String,dynamic> toJson() =>{
    "UserName": userName,
    "UserID": userID,
    "AppID": appID,
    "PhoneNumber": phoneNumber
  };
}

class GetJwtKey{
  
  GetJwtKey._({required this.jwtKey});
  final String jwtKey;
  
  factory GetJwtKey.fromJson(Map<String,dynamic> json) =>
      GetJwtKey._(jwtKey: json["Authorization"]);
  Map<String,dynamic> toJson() =>{
    "Authorization": jwtKey
  };
  
}