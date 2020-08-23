class ServerCategory {
  final String name;
  final int iconIndex;

  const ServerCategory(this.name, this.iconIndex);
}

class CategoryTable {
  Map<int, ServerCategory> categories;

  CategoryTable.fromDate({List<dynamic> data}) {
    categories = {};
    categories[0] = ServerCategory("Всё", 0);

    if (data != null)
      for (var cat in data) {
        categories[cat["id"]] = ServerCategory(cat["name"], cat["icon_index"]);
      }
  }
}
