class Achivement {
  final int id;
  final String name;
  final String caption;
  final String picture;
  final double reward;

  Achivement.fromJson(Map<String, dynamic> data)
      : id = data["id"] ?? 0,
        name = data["name"] ?? " ",
        caption = data["caption"] ?? " ",
        picture = data["picture"] ?? " ",
        reward = data["reward"] ?? 1.0;
}
