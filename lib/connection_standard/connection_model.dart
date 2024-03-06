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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AppID'] = appID;
    data['AppName'] = appName;
    data['AppPicture'] = appPicture;
    data['AppType'] = appType;
    data['AppLink'] = appLink;
    return data;
  }
}