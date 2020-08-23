class tempUser {
  int id;
  String name = '';
  String surname = '';
  String avatarUrl = '';
  double rank = 0;

  tempUser.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    surname = json['surname'];
    rank = json['rank'];
    avatarUrl = json['avatar']['url'] ?? "";
  }
}
