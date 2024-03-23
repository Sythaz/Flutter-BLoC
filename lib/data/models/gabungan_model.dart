class GabunganModel {
  String? fullname;
  String? profile;
  String? email;
  String? fyi;

  GabunganModel({this.fullname, this.profile, this.email, this.fyi});

  GabunganModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    profile = json['profile'];
    email = json['email'];
    fyi = json['fyi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['fyi'] = this.fyi;
    return data;
  }
}
