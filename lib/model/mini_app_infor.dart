class MiniAppInfor {
  int? appID;
  String? appName;
  String? appPicture;
  String? appType;

  MiniAppInfor({this.appID, this.appName, this.appPicture, this.appType});

  MiniAppInfor.fromJson(Map<String, dynamic> json) {
    appID = json['AppID'];
    appName = json['AppName'];
    appPicture = json['AppPicture'];
    appType = json['AppType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppID'] = this.appID;
    data['AppName'] = this.appName;
    data['AppPicture'] = this.appPicture;
    data['AppType'] = this.appType;
    return data;
  }
}