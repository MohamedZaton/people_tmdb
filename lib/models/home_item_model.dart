class HomeItemModel {
  String? titleApp;
  String? details;
  String? iconPath;
  String? htmlGoPath;
  List<String>? tech;

  HomeItemModel(
      {this.titleApp, this.details, this.iconPath, this.htmlGoPath, this.tech});

  factory HomeItemModel.fromJson(Map<String, dynamic> map) {
    return HomeItemModel(
      titleApp: map['label_name'] ?? "",
      iconPath: map['icon_path'] ?? "",
      htmlGoPath: map['html_go_path'] ?? "",
      details: map['details'] ?? "",
      tech: map['tech'].cast<String>() ?? <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label_name'] = this.titleApp;
    data['icon_path'] = this.iconPath;
    data['html_go_path'] = this.htmlGoPath;
    data['details'] = this.details;
    data['tech'] = this.tech;
    return data;
  }

  static List<HomeItemModel> getListObject(List<dynamic> jsonBody) {
    List<HomeItemModel> itemsList = List<HomeItemModel>.from(
        jsonBody.map((val) => HomeItemModel.fromJson(val)));
    return itemsList;
  }
}
