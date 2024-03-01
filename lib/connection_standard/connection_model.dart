class MiniAppInfo {
  int? appID;
  String? appName;
  String? appPicture;
  String? appType;
  String? appLink;

  MiniAppInfo({this.appID, this.appName, this.appPicture, this.appType,this.appLink});

  MiniAppInfo.fromJson(Map<String, dynamic> json) {
    appID = json['AppID'];
    appName = json['AppName'];
    appPicture = json['AppPicture'];
    appType = json['AppType'];
    appLink = json['AppLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppID'] = this.appID;
    data['AppName'] = this.appName;
    data['AppPicture'] = this.appPicture;
    data['AppType'] = this.appType;
    data['AppLink'] = this.appLink;
    return data;
  }
}