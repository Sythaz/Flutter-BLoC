class WikiModel {
  DataWiki? data;

  WikiModel({this.data});

  WikiModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataWiki.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataWiki {
  List<Info>? info;
  String? imageLink;

  DataWiki({this.info, this.imageLink});

  DataWiki.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(new Info.fromJson(v));
      });
    }
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.map((v) => v.toJson()).toList();
    }
    data['image_link'] = this.imageLink;
    return data;
  }
}

class Info {
  int? id;
  String? tahukahAnda;

  Info({this.id, this.tahukahAnda});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tahukahAnda = json['tahukah_anda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tahukah_anda'] = this.tahukahAnda;
    return data;
  }
}
