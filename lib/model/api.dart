class Post {
  final String userId;
  Post({this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;

    return map;
  }
}