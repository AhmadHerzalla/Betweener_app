class LinkResponse {
  int? totalResults;
  List<Link> results = [];

  LinkResponse.fromJson(Map<String, dynamic> json) {
    //you can use your custom json field depend on api response
    // totalResults = json['total_results'];
    if (json['links'] != null) {
      json['links'].forEach((v) {
        results.add(Link.fromJson(v));
      });
    }
  }
}

class Link {
  int? id;
  String? title;
  String? link;
  String? username;
  String? isActive;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Link(
      {this.id,
      this.title,
      this.link,
      this.username,
      this.isActive,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Link.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    username = json['username'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    data['username'] = username;
    data['isActive'] = isActive;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
